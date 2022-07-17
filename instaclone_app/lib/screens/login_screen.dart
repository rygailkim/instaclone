import 'package:flutter/material.dart';
import 'package:instaclone_app/resources/auth_methods.dart';
import 'package:instaclone_app/responsive/mobile_screen_layout.dart';
import 'package:instaclone_app/responsive/responsive_layout_screen.dart';
import 'package:instaclone_app/responsive/web_screen_layout.dart';
import 'package:instaclone_app/utils/colors.dart';
import 'package:instaclone_app/utils/utils.dart';
import 'package:instaclone_app/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);

    if (res == "success") {
      showSnackBar(context, res);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: mobileBackgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Flexible(child: Container(), flex: 2),
          // logo
          Image.asset('assets/instaclone_logo.png', height: 64),

          const SizedBox(height: 64),

          // email
          TextFieldInput(
            hintText: 'Phone number, email or username',
            textInputType: TextInputType.emailAddress,
            textEditingController: _emailController,
          ),

          const SizedBox(
            height: 24,
          ),

          // password
          TextFieldInput(
            hintText: 'Password',
            textInputType: TextInputType.text,
            textEditingController: _passwordController,
            isPass: true,
          ),

          const SizedBox(
            height: 24,
          ),

          // login button
          InkWell(
            child: Container(
              child:
                  const Text('Log in', style: TextStyle(color: Colors.white)),
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
            height: 8,
          ),
          Flexible(
            child: Container(),
            flex: 2,
          ),

          // sign up
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: const Text(
                  'Dont have an account?',
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
              GestureDetector(
                onTap: loginUser,
                child: Container(
                  child: const Text(
                    ' Sign up.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
