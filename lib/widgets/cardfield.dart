import 'package:flutter/material.dart';

class CardField extends StatelessWidget {
  const CardField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 30, left: 30,top: 10,bottom: 10),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Security Code",
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)))
        ),
      ),
    );
  }
}
