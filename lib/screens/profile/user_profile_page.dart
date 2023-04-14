import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/foto_secici_view_model.dart';
import '../../viewmodel/user_view_model.dart';
import 'common_widgets.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _aboutController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _passwordVisible = false;
  bool editMood = false;
  late String _userName;
  final FotoSeciciViewModel _fotoViewModel = FotoSeciciViewModel();

  @override
  void dispose() {
    _emailController.dispose();
    _aboutController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void visibilityPassword() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  late String downloadUrl;

  Future<void> _resimEkleAlertDialog(String id) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resim Ekle'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  child: Text('Galeriden Seç'),
                  onTap: (() async {
                    await _fotoViewModel.fromGallery(id);
                    if (_fotoViewModel.secilenFoto != null) {
                      setState(() {
                        downloadUrl = _fotoViewModel.downloadUrl;
                      });
                    }
                  }),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                    child: const Text('Kameradan Çek'),
                    onTap: () async {
                      await _fotoViewModel.fromCamera(id);
                      if (_fotoViewModel.secilenFoto != null) {
                        setState(() {
                          downloadUrl = _fotoViewModel.downloadUrl;
                        });
                      }
                    }),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserViewModel>(context, listen: false);
    _emailController.text = user.user!.email ?? "";
    _aboutController.text = user.user!.userName ?? "";
    _passwordController.text = user.user!.userID ?? "";
    _userName = user.user!.userName ?? "";
    downloadUrl = user.user!.profilImgURL!;
  }

  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<UserViewModel>(context, listen: false);
    final user = Provider.of<UserViewModel>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ChangeNotifierProvider<FotoSeciciViewModel>(
        create: (context) => FotoSeciciViewModel(),
        child:
            Consumer<FotoSeciciViewModel>(builder: (context, fotoViewModel, _) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        profileImageContainer(fotoViewModel.secilenFoto != null
                            ? fotoViewModel.secilenFoto!.path
                            : downloadUrl),
                        Positioned(
                            top: 5,
                            right: 8,
                            child: CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              radius: 15,
                              child: IconButton(
                                icon: editMood
                                    ? IconButton(
                                        icon: const Icon(Icons.add_a_photo),
                                        onPressed: () => _resimEkleAlertDialog(
                                            user.user!.userID!))
                                    : IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.edit,
                                          size: 27,
                                        ),
                                      ),
                                onPressed: () {
                                  setState(() {
                                    editMood = true;
                                  });
                                },
                              ),
                            ))
                      ],
                    ),
                    sizedBoxWidget(30),
                    nameText(_userName),
                    sizedBoxWidget(60),
                    textWidget("E-POSTA ADRESİ"),
                    SizedBox(
                      height: 2,
                    ),
                    mailSizedboxAndTextForm(_emailController, editMood),
                    SizedBox(
                      height: 20,
                    ),
                    textWidget("HAKKINDA"),
                    aboutSizedboxAndTextForm(_aboutController, editMood),
                    sizedBoxWidget(20),
                    textWidget("ŞİFRE"),
                    sizedBoxWidget(10),
                    Center(
                      child: passwordSizedboxAndTextForm(_passwordController,
                          _passwordVisible, visibilityPassword, editMood),
                    ),
                    sizedBoxWidget(20),
                    editMood
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    editMood = false;
                                  });
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
                                  }
                                },
                                child: TextButton(
                                  onPressed: () {
                                    /*   _fotoViewModel.updateUserProfileImage(
                                      user.user!.userID!, fileToUpload);
                                  debugPrint("profil guncelledi");*/
                                  },
                                  child: Text(
                                    "Kaydet",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
