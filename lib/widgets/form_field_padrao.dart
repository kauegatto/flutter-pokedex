import 'package:flutter/material.dart';

class FormFieldPadrao extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final Function(String?)? onSaved;
  final bool obscureText;
  final double containerWidthPercentage;

  const FormFieldPadrao({
    Key? key,
    this.controller,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onSaved,
    this.obscureText = false,
    this.containerWidthPercentage = 90,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          MediaQuery.of(context).size.width * (containerWidthPercentage / 100),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        initialValue: initialValue,
        keyboardType: keyboardType,
        validator: validator,
        onSaved: onSaved,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
