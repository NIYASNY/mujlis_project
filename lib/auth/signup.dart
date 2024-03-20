// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:ui_for_college/auth/widgets/appcolors.dart';
// import 'package:ui_for_college/auth/widgets/auth.dart';
// import 'package:ui_for_college/auth/widgets/primary.dart';
// import 'package:ui_for_college/auth/widgets/socialbutton.dart';
// import 'package:ui_for_college/auth/widgets/text_divider.dart';
// import 'package:ui_for_college/homepage.dart';
// import 'package:ui_for_college/image_path.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _numberController = TextEditingController();
//   // SignupBloc signupBloc = SignupBloc();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colorspage.kWhite,
//         appBar: AppBar(
//             backgroundColor: Colorspage.kWhite,
//             elevation: 0,
//             leading: const BackButton(
//               color: Colorspage.kPrimary,
//             )),
//         body: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           padding: const EdgeInsets.all(20),
//           child: Form(
//             key: _formKey,
//             child: Center(
//               child: Column(
//                 children: [
//                   const Text('Create Account',
//                       style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black)),

//                   const SizedBox(height: 35),
//                   // FullName.
//                   AuthField(
//                     hintText: 'Enter your name',
//                     controller: _nameController,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Name is required';
//                       }
//                       return null;
//                     },
//                     keyboardType: TextInputType.name,
//                     textInputAction: TextInputAction.next,
//                   ),
//                   const SizedBox(height: 15),
//                   // Email Field.
//                   AuthField(
//                     hintText: 'Enter your email address',
//                     controller: _emailController,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Email is required';
//                       }
//                       return null;
//                     },
//                     keyboardType: TextInputType.emailAddress,
//                     textInputAction: TextInputAction.next,
//                   ),
//                   const SizedBox(height: 15),
//                   AuthField(
//                     hintText: 'Enter your Phone number',
//                     controller: _numberController,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Enter Phone number';
//                       }
//                       return null;
//                     },
//                     keyboardType: TextInputType.phone,
//                     textInputAction: TextInputAction.next,
//                   ),
//                   const SizedBox(height: 15),
//                   // Password Field.
//                   AuthField(
//                     hintText: 'Enter your password',
//                     controller: _passwordController,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Password is required';
//                       }
//                       return null;
//                     },
//                     isPassword: true,
//                     keyboardType: TextInputType.visiblePassword,
//                     textInputAction: TextInputAction.done,
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     children: [
//                       SizedBox(),
//                       const Spacer(),
//                       RichText(
//                         text: TextSpan(
//                           text: 'Already have an account? ',
//                           style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w700,
//                               color: Colorspage.kGrey70),
//                           children: [
//                             TextSpan(
//                               text: 'Sign In',
//                               recognizer: TapGestureRecognizer()
//                                 ..onTap = () {
//                                   //   Navigator.push(
//                                   //       context,
//                                   //       MaterialPageRoute(
//                                   //           builder: (context) =>
//                                   //               const SignIn()));
//                                 },
//                               style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w700,
//                                   color: Colorspage.kPrimary),
//                             ),
//                           ],
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   PrimaryButton(
//                     onTap: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => HomePage()));
//                     },
//                     // onTap: () {
//                     //   if (_formKey.currentState!.validate()) {
//                     //     signupBloc.add(SignUpButtonPressedEvent(
//                     //         name: _nameController.text,
//                     //         email: _emailController.text,
//                     //         password: _passwordController.text,
//                     //         mobile: _numberController.text,
//                     //         context: context));
//                     //   }
//                     // },
//                     text: 'Create An Account',
//                   ),
//                   const SizedBox(height: 30),
//                   const TextWithDivider(),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       CustomSocialButton(
//                         onTap: () {},
//                         icon: AssetImagepath.kGoogle,
//                       ),
//                     ],
//                   ),
//                   // const SizedBox(height: 20),
//                   // const AgreeTermsTextCard(),
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_for_college/widgets/assetfolder.dart';
import 'package:ui_for_college/widgets/homepage.dart';
import 'package:ui_for_college/widgets/signin_button.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final emailController = TextEditingController();
  final passcontroller = TextEditingController();

  void signinuser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.network(
                "https://www.48hourslogo.com/48hourslogo_data/2015/07/15/201507151540519778.jpg",
                width: 150,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Welcome back you've been missed!",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 25.0),
              //   child: TextField(
              //     controller: namecontroller,
              //     decoration: InputDecoration(
              //         hintText: "Username",
              //         enabledBorder: OutlineInputBorder(
              //           borderSide: BorderSide(color: Colors.black),
              //         ),
              //         filled: true,
              //         fillColor: Colors.grey.shade200),
              //   ),
              // ),
              // const SizedBox(
              //   height: 25,
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: passcontroller,
                  decoration: InputDecoration(
                      hintText: "Enter Your Email",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: passcontroller,
                  decoration: InputDecoration(
                      hintText: "Enter Your Password",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200),
                ),
              ),
              // const SizedBox(
              //   height: 25,
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 25.0),
              //   child: TextField(
              //     controller: passcontroller,
              //     decoration: InputDecoration(
              //         hintText: "Blood group",
              //         enabledBorder: OutlineInputBorder(
              //           borderSide: BorderSide(color: Colors.black),
              //         ),
              //         filled: true,
              //         fillColor: Colors.grey.shade200),
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              SignInButton(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                    Text("Or continue with"),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Assetfolder(imageside: "assets/google.png"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
