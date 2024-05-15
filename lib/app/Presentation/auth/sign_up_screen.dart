import 'package:flutter/material.dart';
import 'package:my_chatbot/app/Presentation/Widgets/app_button.dart';
import 'package:my_chatbot/app/Presentation/Widgets/external_signin_button.dart';
import 'package:my_chatbot/app/Presentation/Widgets/input_field.dart';
import 'package:my_chatbot/app/Presentation/auth/login_screen.dart';
import 'package:my_chatbot/app/Presentation/chatbot_screen.dart';
import 'package:my_chatbot/app/Presentation/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isLoading = false;
  String fullName = "";
  String email = "";
  String password = "";
  String confirmPassword = "";

  signUPUser() async {
    if (_isLoading) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          //height: MediaQuery.of(context).size.height - 50,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  // Flexible(
                  //   flex: 3,
                  //   fit: FlexFit.tight,
                  //   child: Container(),
                  // ),
                  Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.grey.shade300, fontSize: 24),
                  ),
                  const Text(
                    "Create your account",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  InputField(
                    onChange: (value) {
                      fullName = value;
                    },
                    hintText: "Enter your name",
                    label: "Name",
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  InputField(
                    onChange: (value) {
                      email = value;
                    },
                    hintText: "Enter Email",
                    label: "Email",
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  InputField(
                    onChange: (value) {
                      password = value;
                    },
                    hintText: "Enter Password",
                    isPassword: true,
                    label: "Password",
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  InputField(
                    onChange: (value) {
                      confirmPassword = value;
                    },
                    hintText: "Re-Enter Password",
                    isPassword: true,
                    label: "Confirm Password",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AppButton(onPress: signUPUser, text: "Sign Up"),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.grey.shade300,
                          height: 2,
                          margin: const EdgeInsets.only(right: 12),
                        ),
                      ),
                      const Text(
                        "or sign in with",
                        style: TextStyle(fontSize: 15),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.grey.shade300,
                          height: 2,
                          margin: const EdgeInsets.only(left: 12),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ExternalSigninButton(
                            imagePath: "assets/images/Google.png",
                            label: "Google",
                            onPress: () {}),
                      ),
                      // Expanded(child: Container()),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: ExternalSigninButton(
                            imagePath: "assets/images/Facebook.png",
                            label: "Facebook",
                            onPress: () {}),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.green),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Container(),
            ],
          ),
        ),
      )),
    );
  }
}
