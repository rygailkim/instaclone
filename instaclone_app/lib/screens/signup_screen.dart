import 'package:flutter/material.dart';
import 'package:instaclone_app/resources/auth_methods.dart';
import 'package:instaclone_app/responsive/mobile_screen_layout.dart';
import 'package:instaclone_app/responsive/responsive_layout_screen.dart';
import 'package:instaclone_app/responsive/web_screen_layout.dart';
import 'package:instaclone_app/utils/colors.dart';
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

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
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
              const CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1657947311396-a5e662d14d22?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
                backgroundColor: Colors.red,
              ),
              Positioned(
                bottom: -10,
                left: 80,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_a_photo),
                  color: blueColor,
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
