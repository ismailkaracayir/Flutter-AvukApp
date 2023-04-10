import 'package:flutter/material.dart';

import '../../viewmodel/user_view_model.dart';

Widget get dividerWidget => SizedBox(
      width: 250, // Bölücünün genişliği 200 piksel olacak
      child: Divider(
        thickness: 2, // Bölücünün kalınlığı 2 piksel olacak
        color: Colors.grey[300], // Bölücünün rengi gri tonunda olacak
      ),
    );
Widget sizedBoxWidget(double height) => const SizedBox(
      height: 10,
    );

Widget textWidget(String text) => Text(
      text,
      style: const TextStyle(fontSize: 15, color: Colors.grey),
    );
Stack userProfileImageContainer(String downloadUrl, Function uploadFromCamera) {
  return Stack(
    children: [
      Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(downloadUrl),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: Colors.white,
            width: 5,
          ),
        ),
      ),
      Positioned(
          top: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: IconButton(
              icon: const Icon(Icons.add_a_photo),
              onPressed: () {
                uploadFromCamera();
                // Profil güncelleme işlemleri burada gerçekleştirilebilir
              },
            ),
          ))
    ],
  );
}

Text nameText(UserViewModel user) {
  return Text(
    user.user!.userName!.toUpperCase(),
    style: const TextStyle(
        fontWeight: FontWeight.w400, fontSize: 20, color: Colors.black),
  );
}

SizedBox mailSizedboxAndTextForm(TextEditingController _emailController) {
  return SizedBox(
    width: 300,
    child: TextFormField(
      controller: _emailController,
      textAlign: TextAlign.center,
      // initialValue: "user.user!.email",
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 13, color: Colors.blueGrey),
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
  );
}

SizedBox aboutSizedboxAndTextForm(TextEditingController _aboutController) {
  return SizedBox(
    width: 300,
    child: TextFormField(
      controller: _aboutController,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 15, color: Colors.blueGrey),
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
  );
}

SizedBox passwordSizedboxAndTextForm(TextEditingController _passwordController,
    bool _passwordVisible, Function setstatePassword) {
  return SizedBox(
    width: 300,
    child: TextFormField(
      controller: _passwordController,
      textAlign: TextAlign.center,
      obscureText: !_passwordVisible,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 15, color: Colors.blueGrey),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: _passwordVisible
              ? Icon(Icons.visibility)
              : Icon(Icons.visibility_off),
          onPressed: (() {
            setstatePassword();
          }),
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
  );
}
