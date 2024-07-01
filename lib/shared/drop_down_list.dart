// ignore_for_file: must_be_immutable, use_super_parameters

import 'package:flutter/material.dart';

import 'componente.dart';

class DefaultDropdown extends StatelessWidget {
  Object? value;
  Function(Object?)? onChanged;
  List<DropdownMenuItem<Object>>? items;
  String? Function(Object?)? validator;
  double? radius;
  double? height;
  double? width;
  Color? colorBorder;
  Color? color;
  TextStyle? labelStyle;
  String? labelText;

  DefaultDropdown(
      {Key? key,
      this.onChanged,
      this.items,
      required this.labelText,
      this.labelStyle,
      required this.validator,
      this.radius,
      this.height,
      this.width,
      this.colorBorder,
      this.color,
      this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      iconSize: 0,
      style: const TextStyle(
          fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        counterStyle: const TextStyle(
          fontSize: 13,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        labelText: labelText,
        labelStyle: TextStyle(color: color ?? defultColor, fontSize: 16),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(
            radius ?? 15,
          ),
        ),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            radius ?? 15,
          ),
          borderSide: BorderSide(color: colorBorder ?? defultColor, width: 2),
        ),
        errorMaxLines: 2,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 15),
          borderSide: const BorderSide(width: 2.0, color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 15),
          borderSide: const BorderSide(width: 2.0, color: Colors.red),
        ),
      ),
      value: value,
      borderRadius: BorderRadius.circular(10),
      items: items,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
