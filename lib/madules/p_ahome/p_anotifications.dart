// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/helper/shared.dart';

import '../../models/request_model.dart';
import '../../shared/componente.dart';
import '../widget/card_notification.dart';

// ignore: camel_case_types
class p_anotifications extends StatelessWidget {
  const p_anotifications({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference doctorsFireStore =
        FirebaseFirestore.instance.collection('assistants_info');
    CollectionReference requestsDoctor =
        FirebaseFirestore.instance.collection('requests_assistant');
    return FutureBuilder(
      future: requestsDoctor.get(),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              SizedBox(
                  width: 60,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: logo,
                  ))
            ],
            backgroundColor: Colors.white54,
            automaticallyImplyLeading: false,
            title: const Text(
              "Requests",
              style: TextStyle(color: defultColor, fontWeight: FontWeight.bold),
            ),
          ),
          body: snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var message;
                    if ((snapshot.data!.docs[index]['userId']) ==
                        CacheHelper.getData(key: 'token')) {
                      final alignment =
                          _getAlignment(snapshot.data!.docs[index]['state']);
                      final oppositeAlignment =
                          alignment == CrossAxisAlignment.start
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start;

                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CardNotification(
                            dateRequest: RequestModelAssistant.formJson(
                                snapshot.data!.docs[index]),
                          ));
                    }
                    message = (index == snapshot.data!.docs.length - 1)
                        ? const Center(
                            child: Text('not found requests'),
                          )
                        : const SizedBox();
                    return message;
                  },
                )
              : const Center(
                  child: Text('not found requests'),
                ),
        );
      },
    );
  }

  CrossAxisAlignment _getAlignment(String status) {
    switch (status) {
      case 'Pending':
        return CrossAxisAlignment.start;
      case 'Accepted':
        return CrossAxisAlignment.end;
      case 'Rejected':
        return CrossAxisAlignment.start;
      default:
        return CrossAxisAlignment.start;
    }
  }
}
