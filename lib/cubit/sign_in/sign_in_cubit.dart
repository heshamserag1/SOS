// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/helper/shared.dart';

import '../../helper/snackBar.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(SignInInitialState());

  static SignInCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;

  bool isPassword = true;
  bool isLoading = false;

  void showPassword() {
    isPassword = !isPassword;

    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShowPassword());
  }

  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context,
    required String routeName,
  }) async {
    isLoading = true;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        emit(SignInSuccessState(value.user!.uid));
        print('Done =${value.user!.uid}');
        CacheHelper.saveData(key: "token", value: "${value.user!.uid}");
        CacheHelper.saveData(key: "collection", value: routeName);
        showSnackbar(context, 'Success');
        Navigator.pushReplacementNamed(context, routeName);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackbar(context, 'No user found for that email.');
        print('No user found for that email.');
        emit(SignInErrorState('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        showSnackbar(context, 'Wrong password provided for that user.');
        print('Wrong password provided for that user.');
        emit(SignInErrorState('Wrong password provided for that user.'));
      } else {
        showSnackbar(context, 'No user found.');
        print('m==============${e.message}');
        emit(SignInErrorState(e.message.toString()));
      }
    } catch (ex) {
      showSnackbar(context, 'there was an error== ${ex.toString()}');
      print('there was an error== ${ex.toString()}');
    }
    isLoading = false;
  }
}
