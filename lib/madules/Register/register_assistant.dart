// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/cubit/register/register_cubit.dart';
import '../../shared/componente.dart';
import '../../static/static.dart';
import '../Login/a_Login.dart';
import 'map_gloply.dart';

class r_assistant extends StatefulWidget {
  const r_assistant({super.key});
  static const String id = "r_assistant";

  @override
  State<r_assistant> createState() => _r_assistantState();
}

class _r_assistantState extends State<r_assistant> {
  final ImagePicker picker = ImagePicker();

  File? pickImage;

  String imageUrl = '';
  bool dataImage = false;
  bool datalocation = false;
  fetchImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }
    setState(() {
      pickImage = File(image.path);
    });
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
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();
    var addressController = TextEditingController();
    var priceController = TextEditingController();
    var jobController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return GestureDetector(
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
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, MapGloply.id);
                                },
                                icon: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.location_pin,
                                    color: defultColor,
                                  ),
                                ),
                              ),
                              datalocation
                                  ? const Text(
                                      "Enter Location",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 12,
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: fetchImage,
                                icon: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.image,
                                    color: defultColor,
                                  ),
                                ),
                              ),
                              dataImage
                                  ? const Text(
                                      "Enter Image",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 12,
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                          SizedBox(
                            width: 200,
                            height: 65,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: TextFormField(
                                validator: (date) {
                                  if (date!.trim().isEmpty) {
                                    return 'Enter your name ';
                                  }
                                  return null;
                                },
                                controller: nameController,
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
                              return 'Enter your E-mail ';
                            }
                            return null;
                          },
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
                              return 'Enter your Phone number ';
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
                          height: 75,
                          child: PasswordTextField(
                            controller: passwordController,
                            validator: (date) {
                              if (date!.trim().isEmpty) {
                                return 'Enter your password ';
                              }
                              return null;
                            },
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: TextFormField(
                          controller: jobController,
                          validator: (date) {
                            if (date!.trim().isEmpty) {
                              return 'Enter your job ';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 15.0),
                              labelStyle: TextStyle(color: Colors.grey[600]),
                              labelText: 'your job',
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
                          controller: priceController,
                          validator: (date) {
                            if (date!.trim().isEmpty) {
                              return 'Enter your Price ';
                            }
                          },
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 15.0),
                              labelStyle: TextStyle(color: Colors.grey[600]),
                              labelText: 'price',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 200,
                        height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white)),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              if (imageUrl == "") {
                                setState(() {});
                                dataImage = true;
                              } else if (positionGlobly == null) {
                                setState(() {});
                                datalocation = true;
                              } else {
                                RegisterCubit.get(context).assistantSignUp(
                                  password: passwordController.text,
                                  email: emailController.text,
                                  userName: nameController.text,
                                  phone: phoneController.text,
                                  context: context,
                                  address: addressController.text,
                                  routeName: a_login.id,
                                  price: priceController.text,
                                  specialty: jobController.text,
                                  latitude: positionGlobly!.latitude.toString(),
                                  longitude:
                                      positionGlobly!.longitude.toString(),
                                  imageUrl: imageUrl,
                                );
                              }
                            }
                            if (imageUrl == "") {
                              setState(() {});
                              dataImage = true;
                            }
                            if (positionGlobly == null) {
                              setState(() {});
                              datalocation = true;
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
                                    builder: (context) => const a_login(),
                                  ),
                                );
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
          );
        },
      ),
    );
  }
}
