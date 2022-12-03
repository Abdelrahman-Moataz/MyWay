import 'package:flutter/material.dart';



class LogForm extends StatelessWidget {

  String? title;

   LogForm({
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        decoration:  InputDecoration(
          hintText: title,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
                filled: true,
        ),
      ),
    );
  }
}
