// ignore_for_file: constant_identifier_names, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
