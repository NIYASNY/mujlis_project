import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_for_college/app/controller/auth/widgets/registerlogo.dart';
import 'package:ui_for_college/app/controller/auth/widgets/squaretile.dart';
import 'package:ui_for_college/app/controller/authcontroller.dart';
import 'package:ui_for_college/app/controller/auth/signin.dart';
import 'package:ui_for_college/app/controller/auth/widgets/loginlogo.dart';
import 'package:ui_for_college/app/utils/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final AuthController authController = AuthController.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 5, 226, 78),
      //   title: const Text('Register'),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: SafeArea(
              child: Column(
                children: [
                  const RegisterLogo(),
                  // const ImageLogo(),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (!regExForEmail.hasMatch(value!)) {
                          return 'Please enter valid email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        fillColor: Colors.grey.shade200, filled: true,
                        // border: OutlineInputBorder(),
                        label: Text('Email'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value!.length < 8) {
                          return 'Minimum 8 characters required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        label: Text('Password'),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            "Already have an account..!",
                            style: TextStyle(color: Colors.grey[600]),
                          ))
                    ],
                  ),
                  Obx(() {
                    return Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(8.0),
                          height: 60,
                          decoration: BoxDecoration(
                            color: authcontroller.isAuthenticating
                                ? PrimaryColor
                                : PrimaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: authcontroller.isAuthenticating
                              ? const Center(child: CircularProgressIndicator())
                              : MaterialButton(
                                  onPressed: () async {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    if (formKey.currentState!.validate()) {
                                      print('Ok');
                                      final result =
                                          await authcontroller.register(
                                              emailController.text.trim(),
                                              passwordController.text.trim());
                                      if (!result) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text('Something went wrong'),
                                          backgroundColor: Colors.red,
                                        ));
                                      }
                                    } else {
                                      print('Not ok');
                                    }
                                  },
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                        ),
                      ],
                    );
                  }),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text("Or continue with"),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Squaretile(imagepath: 'assets/google.png')],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
