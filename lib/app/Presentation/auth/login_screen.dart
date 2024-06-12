import 'package:flutter/material.dart';
import 'package:my_chatbot/app/Presentation/Widgets/app_button.dart';
import 'package:my_chatbot/app/Presentation/Widgets/external_signin_button.dart';
import 'package:my_chatbot/app/Presentation/Widgets/input_field.dart';
import 'package:my_chatbot/app/Presentation/auth/sign_up_screen.dart';
import 'package:my_chatbot/app/Presentation/chatbot_screen.dart';
import 'package:my_chatbot/app/Presentation/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  String email = "";
  String password = "";

  loginUser() async {
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
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Container(),
                  ),
                  Image.asset(
                    "assets/images/app_icon.jpeg",
                    height: 150,
                  ),
                  const SizedBox(
                    height: 80,
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
                  // Row(
                  //   children: [
                  //     Checkbox(
                  //       value: false,
                  //       onChanged: (val) {},
                  //     ),
                  //     Text(
                  //       "Remember Me",
                  //       style: TextStyle(
                  //           color: Colors.grey.shade300, fontSize: 16),
                  //     ),
                  //     Expanded(child: Container()),
                  //     GestureDetector(
                  //       onTap: () {
                  //         // Navigator.of(context).push(MaterialPageRoute(
                  //         //     builder: (context) =>
                  //         //         const ForgetPasswordScreen()));
                  //       },
                  //       child: const Text(
                  //         "Forgot Password",
                  //         style: TextStyle(color: Colors.green, fontSize: 16),
                  //       ),
                  //     )
                  //   ],
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  // AppButton(
                  //   onPress: () {
                  //     Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (context) => const SignUpScreen()));
                  //   },
                  //   text: "Create Account",
                  //   isSecondaryButton: true,
                  // ),
                  AppButton(onPress: loginUser, text: "Sign In"),
                  const SizedBox(
                    height: 40,
                  ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Container(
                  //         color: Colors.grey.shade300,
                  //         height: 2,
                  //         margin: const EdgeInsets.only(right: 12),
                  //       ),
                  //     ),
                  //     const Text(
                  //       "or sign in with",
                  //       style: TextStyle(fontSize: 15),
                  //     ),
                  //     Expanded(
                  //       child: Container(
                  //         color: Colors.grey.shade300,
                  //         height: 2,
                  //         margin: const EdgeInsets.only(left: 12),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 40,
                  // ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: ExternalSigninButton(
                  //           imagePath: "assets/images/Google.png",
                  //           label: "Google",
                  //           onPress: () {}),
                  //     ),
                  //     // Expanded(child: Container()),
                  //     const SizedBox(
                  //       width: 16,
                  //     ),
                  //     Expanded(
                  //       child: ExternalSigninButton(
                  //           imagePath: "assets/images/Facebook.png",
                  //           label: "Facebook",
                  //           onPress: () {}),
                  //     )
                  //   ],
                  // ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                        },
                        child: const Text(
                          "Sign Up",
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
                  // Flexible(
                  //   flex: 2,
                  //   fit: FlexFit.tight,
                  //   child: Container(),
                  // ),
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
