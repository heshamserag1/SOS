// ignore_for_file: file_names, camel_case_types

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/sign_in/sign_in_cubit.dart';
import '../../shared/componente.dart';
import '../Register/verify.dart';
import '../Register/who.dart';
import '../what_want/whowont.dart';

class login extends StatelessWidget {
  const login({super.key});
  static const String id = "login";
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: BlocConsumer<SignInCubit, SignInStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    const Image(
                      image: AssetImage(
                        'assets/images/logo-1-sos.png',
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'sign in to access your account',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: TextFormField(
                            controller: emailController,
                            validator: (date) {
                              if (date!.trim().isEmpty) {
                                return 'Enter your E-mail';
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 15.0),
                              labelStyle: TextStyle(
                                color: Colors.grey[600],
                              ),
                              labelText: 'Enter your email',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                        ),
                        PasswordTextField(
                          controller: passwordController,
                          validator: (date) {
                            if (date!.trim().isEmpty) {
                              return 'Enter your Password';
                            }
                          },
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     SizedBox(
                        //       width: 20,
                        //     ),
                        //     TextButton(
                        //       onPressed: () {
                        //         Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //             builder: (context) => const verify(),
                        //           ),
                        //         );
                        //       },
                        //       child: const Text(
                        //         'Forgot password?',
                        //         style: TextStyle(
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 250,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                SignInCubit.get(context).signIn(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    context: context,
                                    routeName: whowant.id);
                              }
                              if (kDebugMode) {
                                print('Done');
                              }
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(color: defultColor),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'New Member?',
                                style: TextStyle(color: Colors.white),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const whoscrean(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Register now',
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: defultColor,
          );
        },
      ),
    );
  }
}
