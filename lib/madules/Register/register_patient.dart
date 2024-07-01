// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names, avoid_types_as_parameter_names

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../cubit/register/register_cubit.dart';
import '../../shared/componente.dart';
import '../Login/p_Login.dart';

class r_patient extends StatelessWidget {
  r_patient({super.key});
  static const String id = "r_patient";
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var addressController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  File? pickImage;
  final ImagePicker picker = ImagePicker();
  String imageUrl = '';
  fetchImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }

    pickImage = File(image.path);

    print("${pickImage?.path}");
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child("images");
    Reference referenceImagesToUpload =
        referenceDirImages.child(p.basename(pickImage!.path));
    try {
      await referenceImagesToUpload.putFile(pickImage!);
      imageUrl = await referenceImagesToUpload.getDownloadURL();
    } catch (e) {
      print("error=${e.toString()}---$e");
    }
    print("imageUrl=$imageUrl");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: RegisterCubit.get(context).isLoading,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: defultColor,
                  elevation: 0,
                ),
                body: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        logo,
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'creating an account',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 200,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: TextFormField(
                                  controller: nameController,
                                  validator: (date) {
                                    if (date!.trim().isEmpty) {
                                      return 'Enter your Name ';
                                    }
                                    return null;
                                  },
                                  style: const TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 15.0),
                                    labelStyle:
                                        TextStyle(color: Colors.grey[600]),
                                    labelText: 'Full name',
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              child: IconButton(
                                onPressed: fetchImage,
                                icon: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.image,
                                    color: defultColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: TextFormField(
                            controller: addressController,
                            validator: (date) {
                              if (date!.trim().isEmpty) {
                                return 'Enter your address ';
                              }
                              return null;
                            },
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 15.0),
                              labelStyle: TextStyle(color: Colors.grey[600]),
                              labelText: 'Address',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: TextFormField(
                            controller: emailController,
                            validator: (date) {
                              if (date!.trim().isEmpty) {
                                return 'Enter your email ';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 15.0),
                                labelStyle: TextStyle(color: Colors.grey[600]),
                                labelText: 'Valid email',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: TextFormField(
                            controller: phoneController,
                            validator: (date) {
                              if (date!.trim().isEmpty) {
                                return 'Phone number';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 15.0),
                                labelStyle: TextStyle(color: Colors.grey[600]),
                                labelText: 'Phone number',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                )),
                          ),
                        ),
                        SizedBox(
                            height: 70,
                            child: PasswordTextField(
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return 'Enter your Password';
                                } else if (value.length < 8) {
                                  return 'The password is less than 8 numbers';
                                }
                                return null;
                              },
                              controller: passwordController,
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: SizedBox(
                            width: 250,
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  RegisterCubit.get(context).userSignUp(
                                    password: passwordController.text,
                                    email: emailController.text,
                                    userName: nameController.text,
                                    phone: phoneController.text,
                                    context: context,
                                    address: addressController.text,
                                    routeName: login.id,
                                    imageUrl: imageUrl,
                                  );
                                }
                                if (kDebugMode) {
                                  print('Done');
                                }
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(color: defultColor),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already a member?',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const login()));
                                },
                                child: const Text(
                                  'Log In',
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1)),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                backgroundColor: defultColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
