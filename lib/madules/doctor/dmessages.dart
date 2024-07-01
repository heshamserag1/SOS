// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubit/update_request/update_request_cubit.dart';
import 'package:untitled/helper/shared.dart';
import 'package:untitled/madules/card_requests.dart';

import '../../shared/componente.dart';

// ignore: camel_case_types
class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    // Mock data for demonstrationCollectionReference doctorsFireStore =
    CollectionReference doctorsMessageFireStore =
        FirebaseFirestore.instance.collection('requests_doctor');

    return BlocProvider(
      create: (context) => UpdateRequestCubit(),
      child: BlocConsumer<UpdateRequestCubit, UpdateRequestState>(
        listener: (context, state) {},
        builder: (context, state) {
          return FutureBuilder<QuerySnapshot>(
              future: doctorsMessageFireStore.get(),
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
                      "Messages",
                      style: TextStyle(
                          color: defultColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  body: snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (ctx, index) {
                            var message;
                            if (snapshot.data?.docs[index]['doctorId'] ==
                                token) {
                              if (snapshot.hasData &&
                                  (snapshot.data?.docs[index]['state'] ==
                                      "wating")) {
                                return CardRequests(
                                  doc: snapshot.data?.docs[index]['userId'],
                                  message: snapshot.data?.docs[index]
                                      ['message'],
                                  state: snapshot.data?.docs[index]['state'],
                                  address: snapshot.data?.docs[index]
                                      ['address'],
                                  onTapRejected: () {
                                    setState(() {
                                      UpdateRequestCubit.get(ctx)
                                          .updateRequestDoctor(
                                              requestId:
                                                  snapshot.data!.docs[index].id,
                                              state: "Rejected");
                                    });
                                  },
                                  onTapAccepted: () {
                                    setState(() {
                                      UpdateRequestCubit.get(ctx)
                                          .updateRequestDoctor(
                                              requestId:
                                                  snapshot.data!.docs[index].id,
                                              state: "Accepted");
                                    });
                                  },
                                );
                              }
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
                          child: Text("not found message"),
                        ),
                );
              });
        },
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Accepted':
        return Colors.green;
      case 'Rejected':
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'Pending':
        return 'Pending';
      case 'Accepted':
        return 'Accepted';
      case 'Rejected':
        return 'Rejected';
      default:
        return '';
    }
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
