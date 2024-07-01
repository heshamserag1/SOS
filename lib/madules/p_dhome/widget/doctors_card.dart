// ignore_for_file: avoid_renaming_method_parameters

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/register/register_cubit.dart';
import '../../../cubit/update_profile/update_profile_cubit.dart';
import '../../../helper/shared.dart';
import '../../../models/doctor_model.dart';
import '../../../shared/componente.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  final String doctorId;
  final bool isDoctor;

  const DoctorCard({
    super.key,
    required this.doctor,
    required this.doctorId,
    required this.isDoctor,
  });

  @override
  Widget build(BuildContext ctx) {
    var addressController = TextEditingController();
    var messageController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    sendRequest(context) {
      if (isDoctor == true) {
        UpdateProfileCubit.get(context)
            .requestDoctors(
              userId: CacheHelper.getData(key: 'token'),
              doctorId: doctorId,
              address: addressController.text,
              message: messageController.text,
              state: 'wating',
            )
            .then((value) => Navigator.of(context).pop());
        print(CacheHelper.getData(key: 'token'));
      } else {
        UpdateProfileCubit.get(context)
            .requestAssistant(
              userId: CacheHelper.getData(key: 'token'),
              assistantId: doctorId,
              address: addressController.text,
              message: messageController.text,
              state: 'wating',
            )
            .then((value) => Navigator.of(context).pop());
      }
    }

    print(doctor.imageUrl);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 75,
                height: 75,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    doctor.imageUrl,
                    width: 75,
                    height: 75,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      const SizedBox(width: 4),
                      Text(doctor.location),
                      const SizedBox(width: 25),
                      Text('Price:${doctor.price}\$'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      const SizedBox(width: 4),
                      Text(
                        doctor.rating.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: SizedBox(
                          height: 30,
                          child: TextButton(
                            onPressed: () {
                              // عرض مربع حوار لإدخال البيانات
                              showDialog(
                                context: ctx,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                      'Enter address and message',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: defultColor),
                                    ),
                                    content: Form(
                                      key: formKey,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            validator: (value) {
                                              if (value!.trim().isEmpty) {
                                                return 'Enter your address ';
                                              }
                                              return null;
                                            },
                                            controller: addressController,
                                            decoration: InputDecoration(
                                              labelText: 'address',
                                            ),
                                          ),
                                          TextFormField(
                                            validator: (value) {
                                              if (value!.trim().isEmpty) {
                                                return 'Enter your message ';
                                              }
                                              return null;
                                            },
                                            controller: messageController,
                                            decoration: InputDecoration(
                                              labelText: 'message',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          // تنفيذ عند الضغط على زر الحفظ
                                          // يمكنك القيام بالإجراءات المناسبة هنا
                                          if (formKey.currentState!
                                              .validate()) {
                                            sendRequest(ctx);

                                            /// address
                                            /// message
                                            /// uid
                                            /// Did
                                            /// state = wating
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              defultColor, // تعيين لون الخلفية إلى اللون الأخضر
                                        ),
                                        child: const Text('Send',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: TextButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                            ),
                            child: const Text(
                              'reservation',
                              style: TextStyle(
                                  color: defultColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Specialization: ${doctor.specialty}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
