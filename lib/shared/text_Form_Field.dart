// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters
// ignore_for_file: file_names, unnecessary_null_in_if_null_operators, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/shared/componente.dart';

class DefaultFormField extends StatelessWidget {
  Color? textColor;
  int? MaxLength;
  double? fontSize;
  double? radius;
  TextEditingController controller;
  TextInputType? keyboardType;
  String? label;
  Widget? prefixIcon;
  Color? colorBorder;
  IconData? suffixIcon;
  TextAlign? textAlign;
  Function? suffixPressed;
  List<TextInputFormatter>? inputFormatters;
  String? hint;
  void Function(String)? onChanged;
  void Function(String?)? onSaved;
  bool? isPassword;
  Color? fillColor;
  Color? colorFont;
  void Function()? onTap;
  String? Function(String?)? validator;

  DefaultFormField({
    Key? key,
    this.textColor,
    this.MaxLength,
    this.fillColor,
    this.colorFont,
    this.fontSize,
    this.radius,
    this.validator,
    required this.controller,
    this.keyboardType,
    this.label,
    this.prefixIcon,
    this.colorBorder,
    this.suffixIcon,
    this.textAlign,
    this.suffixPressed,
    this.inputFormatters,
    this.hint,
    this.onChanged,
    this.onSaved,
    this.isPassword,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      onTap: onTap ?? null,
      validator: validator,
      obscureText: isPassword ?? false,
      cursorColor: defultColor,
      textAlign: textAlign ?? TextAlign.start,
      maxLength: MaxLength ?? null,
      style: TextStyle(
        color: textColor ?? Colors.black,
        fontSize: (fontSize ?? 14),
        fontWeight: FontWeight.w500,
      ),
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 18,
          color: colorFont,
          fontWeight: FontWeight.w600,
        ),
        counterStyle: const TextStyle(
          fontSize: 13,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        labelText: label,
        labelStyle: TextStyle(color: textColor ?? defultColor, fontSize: 16),
        prefixIcon: prefixIcon ?? null,
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(suffixIcon))
            : null,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(
            radius ?? 15,
          ),
        ),
        fillColor: fillColor,
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
    );
  }
}
