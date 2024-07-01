import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_request_state.dart';

class UpdateRequestCubit extends Cubit<UpdateRequestState> {
  UpdateRequestCubit() : super(UpdateRequestInitial());
  static UpdateRequestCubit get(context) => BlocProvider.of(context);

  Future<void> updateRequestDoctor({
    required String requestId,
    required String state,
  }) {
    CollectionReference request =
        FirebaseFirestore.instance.collection('requests_doctor');
    return request
        .doc(requestId)
        .update({
          "state": state,
        })
        .then((value) => print("update Request Doctor"))
        .catchError(
            (error) => print("Failed to update Request Doctor: $error"));
  }

  Future<void> updateRequestAssistant({
    required String requestId,
    required String state,
  }) {
    CollectionReference request =
        FirebaseFirestore.instance.collection('requests_assistant');
    return request
        .doc(requestId)
        .update({
          "state": state,
        })
        .then((value) => print("update Request Assistant"))
        .catchError(
            (error) => print("Failed to update Request Assistant: $error"));
  }
}
