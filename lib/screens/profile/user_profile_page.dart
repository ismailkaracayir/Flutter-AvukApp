import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/user_view_model.dart';
import 'common_widgets.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late final _emailController = TextEditingController();
  late final _aboutController = TextEditingController();
  late final _passwordController = TextEditingController();
  String _lastSavedEmail = '';
  String _lastSavedPassword = '';
  String _lastSavedAbout = '';

  late bool _passwordVisible;
  late File fileToUpload;
  late String downloadUrl;
  FirebaseAuth auth = FirebaseAuth.instance;

  uploadFromCamera() async {
    var receivedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      fileToUpload = File(receivedFile!.path);
    });
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('profilResimleri')
        .child(auth.currentUser!.uid)
        .child('pp.png');
    ref.putFile(fileToUpload).then((taskSnapshot) {
      taskSnapshot.ref.getDownloadURL().then((downloadURL) {
        setState(() {
          downloadUrl = downloadURL;
        });
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _aboutController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserViewModel>(context, listen: false);
    _passwordVisible = false;
    _emailController.text = user.user!.email!;
    _aboutController.text = 'Ben bir öğrenciyim.';
    _passwordController.text = user.user!.userID!;
    _lastSavedEmail = _emailController.text;
    _lastSavedPassword = _passwordController.text;
    _lastSavedAbout = _aboutController.text;
    downloadUrl = user.user!.profilImgURL!;
  }

  void _saveChanges() {
    // Metin düzenleyicisinin değerini kaydet
    _lastSavedEmail = _emailController.text;
    _lastSavedPassword = _passwordController.text;
    _lastSavedAbout = _aboutController.text;
  }

  void _cancelChanges() {
    // Metin düzenleyicisinin değerini önceki kaydedilen değere geri yükle
    setState(() {
      _emailController.text = _lastSavedEmail;
      _passwordController.text = _lastSavedPassword;
      _aboutController.text = _lastSavedAbout;
    });
  }

  void visibilityPassword() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserViewModel>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                userProfileImageContainer(downloadUrl, uploadFromCamera),
                sizedBoxWidget(30),
                nameText(user),
                sizedBoxWidget(60),
                textWidget("E-POSTA ADRESİ"),
                mailSizedboxAndTextForm(_emailController),
                sizedBoxWidget(10),
                textWidget("HAKKINDA"),
                aboutSizedboxAndTextForm(_aboutController),
                sizedBoxWidget(20),
                textWidget("ŞİFRE"),
                sizedBoxWidget(10),
                Center(
                  child: passwordSizedboxAndTextForm(
                    _passwordController,
                    _passwordVisible,
                    visibilityPassword,
                  ),
                ),
                sizedBoxWidget(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        _cancelChanges();
                      },
                      child: const Text(
                        'Vazgeç',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Kaydedilecek verileri burada işleyebilirsiniz
                          _saveChanges();
                        }
                      },
                      child: const Text(
                        'Kaydet',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
