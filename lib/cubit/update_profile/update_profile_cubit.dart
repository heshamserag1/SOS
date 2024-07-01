import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/helper/shared.dart';

import '../../models/request_model.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());
  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController priceEditingController = TextEditingController();
  String imageUrl = '';
  String newImageUrl = '';
  Future<void> updateUser() {
    CollectionReference users =
        FirebaseFirestore.instance.collection('patients_info');
    return users
        .doc(CacheHelper.getData(key: 'token'))
        .update({
          "userName": userNameController.text,
          "phone": phoneEditingController.text,
          "imageUrl": newImageUrl == '' ? imageUrl : newImageUrl,
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> updateDoctor() {
    CollectionReference users =
        FirebaseFirestore.instance.collection('doctors_info');
    return users
        .doc(CacheHelper.getData(key: 'token'))
        .update({
          "userName": userNameController.text,
          "phone": phoneEditingController.text,
          "imageUrl": newImageUrl == '' ? imageUrl : newImageUrl,
          "price": priceEditingController.text,
        })
        .then((value) => print("Doctor Updated"))
        .catchError((error) => print("Failed to update doctor: $error"));
  }

  Future<void> updateAssistants() {
    CollectionReference users =
        FirebaseFirestore.instance.collection('assistants_info');
    return users
        .doc(CacheHelper.getData(key: 'token'))
        .update({
          "userName": userNameController.text,
          "phone": phoneEditingController.text,
          "imageUrl": newImageUrl == '' ? imageUrl : newImageUrl,
          "price": priceEditingController.text,
        })
        .then((value) => print("Assistants Updated"))
        .catchError((error) => print("Failed to update assistants: $error"));
  }

//---------------------------------------------------------
  Future<void> requestDoctors({
    required String userId,
    required String doctorId,
    required String address,
    required String message,
    required String state,
  }) async {
    CollectionReference requestsDoctor =
        FirebaseFirestore.instance.collection('requests_doctor');
    RequestModelDoctor request = RequestModelDoctor(
      userId: userId,
      address: address,
      doctorId: doctorId,
      message: message,
      state: state,
    );
    try {
      await requestsDoctor.add(request.toFireStore());
      print("User Updatedgg");
    } catch (e) {
      print("error request doctor = ${e.toString}");
    }
  }

//---------------------------------------------------------
  var dataUser;
  Future<void> requestAssistant({
    required String userId,
    required String assistantId,
    required String address,
    required String message,
    required String state,
  }) async {
    CollectionReference requestsDoctor =
        FirebaseFirestore.instance.collection('requests_assistant');
    RequestModelAssistant request = RequestModelAssistant(
      userId: userId,
      address: address,
      assistantId: assistantId,
      message: message,
      state: state,
    );
    try {
      await requestsDoctor.add(request.toFireStore());
      print("User Updatedggaa");
    } catch (e) {
      print("error request assistant = ${e.toString}");
    }
  }

  Future<void> getdate() async {
    CollectionReference users =
        await FirebaseFirestore.instance.collection('patients_info');
    users.doc(CacheHelper.getData(key: "token")).get().then((value) async {
      print(CacheHelper.getData(key: "token"));
      print("getdate=${value.data()}");
      imageUrl = value["imageUrl"];
      userNameController.text = value["userName"];
      phoneEditingController.text = value["phone"];

      dataUser = {
        "name": value["userName"],
        "imageUrl": value["imageUrl"],
        "phone": value["phone"]
      };
      return value;
    }).catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> getdateDoctor() async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('doctors_info');
    users.doc(CacheHelper.getData(key: "token")).get().then((value) async {
      print(CacheHelper.getData(key: "token"));
      print("getdate=${value.data()}");
      imageUrl = value["imageUrl"];
      userNameController.text = value["userName"];
      phoneEditingController.text = value["phone"];
      priceEditingController.text = value["price"];

      dataUser = {
        "name": value["userName"],
        "imageUrl": value["imageUrl"],
        "phone": value["phone"],
        "price": value["price"]
      };
      return value;
    }).catchError((error) => print("Failed to update doctor: $error"));
  }

  Future<void> getdateAssistants() async {
    CollectionReference users =
        await FirebaseFirestore.instance.collection('assistants_info');
    users.doc(CacheHelper.getData(key: "token")).get().then((value) async {
      print(CacheHelper.getData(key: "token"));
      print("getdate=${value.data().hashCode}");
      imageUrl = value["imageUrl"];
      userNameController.text = value["userName"];
      phoneEditingController.text = value["phone"];
      priceEditingController.text = value["price"];

      dataUser = {
        "name": value["userName"],
        "imageUrl": value["imageUrl"],
        "phone": value["phone"],
        "price": value["price"]
      };
      return value;
    }).catchError((error) => print("Failed to update assistants: $error"));
  }
}
