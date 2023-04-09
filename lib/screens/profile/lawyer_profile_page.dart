import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/user_view_model.dart';
import 'common_widgets.dart';
import 'user_profile_page.dart';

class LawyerProfilePage extends StatefulWidget {
  const LawyerProfilePage({super.key});

  @override
  State<LawyerProfilePage> createState() => _LawyerProfilePageState();
}

class _LawyerProfilePageState extends State<LawyerProfilePage> {
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
                Text(
                  user.user!.userName!.toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.black),
                ),
                sizedBoxWidget(60),
                textWidget("E-POSTA ADRESİ"),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _emailController,
                    textAlign: TextAlign.center,
                    // initialValue: "user.user!.email",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.blueGrey),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _emailController.text = value!;
                      debugPrint(_emailController.text);
                    },
                  ),
                ),
                sizedBoxWidget(10),
                textWidget("HAKKINDA"),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _aboutController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.blueGrey),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Mail alanı boş bırakılamaz';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _aboutController.text = value!;
                      debugPrint(_aboutController.text);
                    },
                  ),
                ),
                sizedBoxWidget(20),
                textWidget("ŞİFRE"),
                sizedBoxWidget(10),
                Center(
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: _passwordController,
                      textAlign: TextAlign.center,
                      obscureText: !_passwordVisible,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.blueGrey),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: _passwordVisible
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password alanı boş bırakılamaz';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _passwordController.text = value!;
                      },
                    ),
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
                      child: Text(
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
                      child: Text(
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
