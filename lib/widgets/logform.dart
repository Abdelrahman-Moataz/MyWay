import 'package:flutter/material.dart';



class LogForm extends StatelessWidget {

   var controller;
  final bool obscureText;
  final String? title;
  final Function validator;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final TextInputType textInputType;

    LogForm({
    this.title,
    Key? key,
     required this.controller,
     required this.obscureText,
     required this.validator,
     required this.prefixIcon,
     required this.suffixIcon,
     required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        cursorColor: Colors.black,
        keyboardType: textInputType,
        validator: (value) => validator(value),

        decoration:  InputDecoration(

          fillColor: Colors.grey.shade200,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: title,
          helperStyle: const TextStyle(color: Colors.black45,fontSize: 16,fontWeight: FontWeight.w500),
          filled: true,

          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),

          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),




        ),
      ),
    );
  }
}
