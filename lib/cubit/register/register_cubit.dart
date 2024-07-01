// ignore_for_file: body_might_complete_normally_catch_error, use_build_context_synchronously, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/helper/snackBar.dart';

import '../../models/user_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  IconData? suffix = Icons.visibility_outlined;
  IconData? suffixConfirmPassword = Icons.visibility_outlined;

  bool isPassword = true;
  bool isConfirmPassword = true;
  bool isLoading = false;

  void showPassword() {
    isPassword = !isPassword;
    isConfirmPassword = !isConfirmPassword;

    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    suffixConfirmPassword = isConfirmPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ShowPassword());
  }

  void userCreate({
    required String userName,
    required String phone,
    required String email,
    required String imageUrl,
    required String uId,
    required String address,
  }) {
    UserModel model = UserModel(
      email: email,
      phone: phone,
      name: userName,
      uId: uId,
      address: address,
      imageUrl: imageUrl,
    );
    FirebaseFirestore.instance
        .collection("patients_info")
        .doc(uId)
        .set(model.toFireStore())
        .then((value) {
      emit(UserCreateSuccessState(uId));
      print('Done =111111111111111111');
    }).catchError((error) {
      emit(UserCreateErrorState(error.toString()));
    });
  }

  Future<void> userSignUp({
    required String password,
    required String email,
    required String userName,
    required String phone,
    required String address,
    required String imageUrl,
    required String routeName,
    required BuildContext context,
  }) async {
    isLoading = true;
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) => {
                userCreate(
                  userName: userName,
                  phone: phone,
                  email: email,
                  uId: value.user!.uid,
                  address: address,
                  imageUrl: imageUrl,
                ),
                showSnackbar(context, 'Success'),
                print('Success'),
                Navigator.pushReplacementNamed(context, routeName)
              })
          .catchError((error) {
        emit(RegisterErrorState(error.toString()));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackbar(context, 'The password provided is too weak.');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnackbar(context, 'The account already exists for that email.');
        print('The account already exists for that email.');
      } else {
        showSnackbar(context, e.toString());
        print("===${e.toString()}");
      }
    }
    isLoading = false;
  }

// --------------------------------------------------------
  Future<void> doctorsCreate({
    required String userName,
    required String phone,
    required String email,
    required String uId,
    required String imageUrl,
    required String address,
    required String price,
    required String latitude,
    required String longitude,
    required String specialty,
    required String rating,
  }) async {
    DoctorsModel model = DoctorsModel(
      rating: rating,
      email: email,
      phone: phone,
      name: userName,
      uId: uId,
      address: address,
      price: price,
      specialty: specialty,
      latitude: latitude,
      longitude: longitude,
      imageUrl: imageUrl,
    );
    await FirebaseFirestore.instance
        .collection("doctors_info")
        .doc(uId)
        .set(model.toFireStore())
        .then((value) {
      emit(UserCreateSuccessState(uId));
      print('Done =111111111111111111');
    }).catchError((error) {
      emit(UserCreateErrorState(error.toString()));
    });
  }

  Future<void> doctorsSignUp({
    required String password,
    required String imageUrl,
    required String email,
    required String userName,
    required String phone,
    required String address,
    required String routeName,
    required String price,
    required String latitude,
    required String longitude,
    required String specialty,
    required BuildContext context,
  }) async {
    isLoading = true;
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) => {
                doctorsCreate(
                  rating: "5.0",
                  userName: userName,
                  phone: phone,
                  email: email,
                  uId: value.user!.uid,
                  address: address,
                  price: price,
                  specialty: specialty,
                  latitude: latitude,
                  longitude: longitude,
                  imageUrl: imageUrl,
                ),
                showSnackbar(context, 'Success'),
                print('Success'),
                Navigator.pushReplacementNamed(context, routeName)
              })
          .catchError((error) {
        emit(RegisterErrorState(error.toString()));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackbar(context, 'The password provided is too weak.');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnackbar(context, 'The account already exists for that email.');
        print('The account already exists for that email.');
      } else {
        showSnackbar(context, e.toString());
        print("===${e.toString()}");
      }
    }
    isLoading = false;
  }

//----------------------------------------------------------
  void assistantCreate({
    required String userName,
    required String phone,
    required String latitude,
    required String longitude,
    required String imageUrl,
    required String email,
    required String uId,
    required String address,
    required String price,
    required String rating,
    required String specialty,
  }) {
    DoctorsModel model = DoctorsModel(
      email: email,
      phone: phone,
      name: userName,
      uId: uId,
      address: address,
      price: price,
      specialty: specialty,
      rating: rating,
      latitude: latitude,
      longitude: longitude,
      imageUrl: imageUrl,
    );
    FirebaseFirestore.instance
        .collection("assistants_info")
        .doc(uId)
        .set(model.toFireStore())
        .then((value) {
      emit(UserCreateSuccessState(uId));
      print('Done =111111111111111111');
    }).catchError((error) {
      emit(UserCreateErrorState(error.toString()));
    });
  }

  Future<void> assistantSignUp({
    required String password,
    required String email,
    required String userName,
    required String phone,
    required String address,
    required String latitude,
    required String longitude,
    required String routeName,
    required String price,
    required String specialty,
    required String imageUrl,
    required BuildContext context,
  }) async {
    isLoading = true;
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) => {
                assistantCreate(
                  rating: "5.0",
                  userName: userName,
                  phone: phone,
                  email: email,
                  uId: value.user!.uid,
                  address: address,
                  price: price,
                  specialty: specialty,
                  latitude: latitude,
                  longitude: longitude,
                  imageUrl: imageUrl,
                ),
                showSnackbar(context, 'Success'),
                print('Success'),
                Navigator.pushReplacementNamed(context, routeName)
              })
          .catchError((error) {
        emit(RegisterErrorState(error.toString()));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackbar(context, 'The password provided is too weak.');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnackbar(context, 'The account already exists for that email.');
        print('The account already exists for that email.');
      } else {
        showSnackbar(context, e.toString());
        print("===${e.toString()}");
      }
    }
    isLoading = false;
  }
}
