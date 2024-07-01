// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/request_model.dart';

class CardNotification2 extends StatelessWidget {
  final RequestModelDoctor dateRequest;
  const CardNotification2({super.key, required this.dateRequest});

  @override
  Widget build(BuildContext context) {
    final CollectionReference DataDocMessageFireStore =
        FirebaseFirestore.instance.collection('doctors_info');
    return FutureBuilder<DocumentSnapshot>(
        future: DataDocMessageFireStore.doc(dateRequest.doctorId).get(),
        builder: (ctx, snap) {
          Map data = {};
          if (snap.hasData) data = snap.data!.data() as Map;

          return Card(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ListTile(
                leading: SizedBox(
                  width: 55,
                  height: 55,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: snap.hasData
                        ? Image.network(data['imageUrl'], fit: BoxFit.cover)
                        : Image.asset("assets/images/doctor.png",
                            fit: BoxFit.cover),
                  ),
                ),
                title: Column(
                  children: [
                    Text(snap.hasData ? data['userName'] : "user Name"),
                    Text(snap.hasData ? data['specialty'] : "user specialty"),
                    Text(snap.hasData ? data['address'] : "user address"),
                  ],
                ),
                trailing: Text(
                  _getStatusText(dateRequest.state),
                  style: TextStyle(
                    fontSize: 18,
                    color: _getStatusColor(dateRequest.state),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        });
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
      case 'wating':
        return 'wating';
      case 'Accepted':
        return 'Accepted';
      case 'Rejected':
        return 'Rejected';
      default:
        return '';
    }
  }
}
