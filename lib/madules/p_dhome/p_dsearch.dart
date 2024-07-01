// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, must_be_immutable, use_super_parameters

// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/helper/shared.dart';
import 'package:untitled/models/doctor_model.dart';

import '../../cubit/register/register_cubit.dart';
import '../../cubit/update_profile/update_profile_cubit.dart';
import '../../shared/componente.dart';
import 'widget/doctors_card.dart';
import 'widget/filter_dialog.dart';

class p_dsearch extends StatefulWidget {
  List<DoctorAppointment> appointments = [];

  p_dsearch({
    Key? key,
    required this.appointments,
  }) : super(key: key);

  @override
  State<p_dsearch> createState() => _p_dsearchState();
}

class _p_dsearchState extends State<p_dsearch> {
  // FirebaseFirestore fireStore = FirebaseFirestore.instance;
  CollectionReference doctorsFireStore =
      FirebaseFirestore.instance.collection('doctors_info');
  bool isAppointmentAccepted = false;

  String searchValue = '';
  String? selectedLocation;

  String? selectedSpecialty;
  List<Doctor> filteredDoctors = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit(),
      child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return FutureBuilder<QuerySnapshot>(
              future: doctorsFireStore.get(),
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
                    leading: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: defultColor),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: const InputDecoration(
                                  hintText: 'Search for the doctor\'s name',
                                  hintStyle: TextStyle(color: defultColor),
                                  prefixIcon:
                                      Icon(Icons.search, color: defultColor),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    searchValue = value;
                                  });
                                },
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.filter_alt),
                              color: defultColor,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return FilterDialog(
                                      locations: const [
                                        'Cairo',
                                        'Alexandria',
                                        'Aswan',
                                        'Elshorouk',
                                      ],
                                      specialties: const [
                                        'General Doctor',
                                        'obstetrics and gynecology',
                                        'Neurologists',
                                        'onram',
                                      ],
                                      onFilterChanged: (location, specialty) {
                                        setState(() {
                                          selectedLocation = location;

                                          selectedSpecialty = specialty;
                                        });
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: snapshot.hasData
                              ? ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    if ((snapshot.data!.docs[index]
                                                ['userName'] ==
                                            searchValue) ||
                                        searchValue.isEmpty) {
                                      return DoctorCard(
                                        doctor: Doctor.formJson(
                                            snapshot.data!.docs[index]),
                                        doctorId: snapshot.data!.docs.first.id,
                                        isDoctor: true,
                                      );
                                    }
                                    return null;
                                  },
                                )
                              : Center(
                                  child: Text("Not found any Doctors"),
                                ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
