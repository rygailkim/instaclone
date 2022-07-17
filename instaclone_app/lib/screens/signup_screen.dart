import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instaclone_app/resources/auth_methods.dart';
import 'package:instaclone_app/responsive/mobile_screen_layout.dart';
import 'package:instaclone_app/responsive/responsive_layout_screen.dart';
import 'package:instaclone_app/responsive/web_screen_layout.dart';
import 'package:instaclone_app/utils/colors.dart';
import 'package:instaclone_app/utils/utils.dart';
import 'package:instaclone_app/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Container(),
            flex: 2,
          ),
          Image.asset(
            'assets/instaclone_logo.png',
            height: 64,
          ),
          const SizedBox(
            height: 32,
          ),
          Stack(
            children: <Widget>[
              _image != null
                  ? CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(_image!),
                    )
                  : const CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                          'https://icon-library.com/images/default-profile-icon/default-profile-icon-6.jpg'),
                    ),
              Positioned(
                bottom: -10,
                left: 80,
                child: IconButton(
                  onPressed: selectImage,
                  icon: const Icon(Icons.add_a_photo),
                  color: Colors.black,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          TextFieldInput(
            hintText: 'Full name',
            textInputType: TextInputType.text,
            textEditingController: _bioController,
          ),
          const SizedBox(
            height: 16,
          ),
          TextFieldInput(
            hintText: 'Username',
            textInputType: TextInputType.text,
            textEditingController: _usernameController,
          ),
          const SizedBox(
            height: 16,
          ),
          TextFieldInput(
            hintText: 'Email',
            textInputType: TextInputType.emailAddress,
            textEditingController: _emailController,
          ),
          const SizedBox(
            height: 16,
          ),
          TextFieldInput(
            hintText: 'Password',
            textInputType: TextInputType.text,
            textEditingController: _passwordController,
            isPass: true,
          ),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () async {
              String res = await AuthMethods().signUpUser(
                  email: _emailController.text,
                  password: _passwordController.text,
                  username: _usernameController.text,
                  bio: _bioController.text);
              print(res);
            },
            child: Container(
              child:
                  const Text('Sign Up', style: TextStyle(color: Colors.white)),
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                color: blueColor,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Flexible(
            child: Container(),
            flex: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: const Text(
                  'Already have an account?',
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: const Text(
                    ' Log in.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
              ),
            ],
          ),
        ],
      ),
    )));
  }
}
