import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ui_for_college/app/controller/auth/widgets/squaretile.dart';
import 'package:ui_for_college/app/controller/authcontroller.dart';
import 'package:ui_for_college/app/controller/auth/register.dart';
import 'package:ui_for_college/app/controller/auth/widgets/loginlogo.dart';
import 'package:ui_for_college/app/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final AuthController authController = AuthController.instance;
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 5, 226, 78),
      //   title: const Text('Login'),
      // ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: SafeArea(
              child: Column(
                children: [
                  const LoginLogo(),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Welcome back you've have been missed!",
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // const TodoLogo(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: emailcontroller,
                      validator: (value) {
                        if (!regExForEmail.hasMatch(value!)) {
                          return 'Please enter vallid email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          label: Text('Email'),
                          fillColor: Colors.grey.shade200,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: passcontroller,
                      obscureText: true,
                      validator: (value) {
                        if (value!.length < 8) {
                          return 'Minimum 8 Characters required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          label: Text('Password'),
                          fillColor: Colors.grey.shade200,
                          filled: true),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                          },
                          child: Text(
                            "Create a new account..!",
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
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : MaterialButton(
                                    onPressed: () async {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      if (formKey.currentState!.validate()) {
                                        print('ok');
                                        final result =
                                            await authcontroller.signIn(
                                                emailcontroller.text.trim(),
                                                passcontroller.text.trim());
                                        if (!result) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content:
                                                Text('Something went wrong'),
                                            backgroundColor: Colors.red,
                                          ));
                                        }
                                      } else {
                                        print('Not Ok');
                                      }
                                    },
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  )),
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
