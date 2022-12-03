import 'package:flutter/material.dart';

import 'const.dart';

class BottonReuseable extends StatelessWidget {
  String? title;
  void Function()? tap;
  Color? filledColor;

  BottonReuseable({
    this.title,
    this.filledColor,
    this.tap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: GestureDetector(
        onTap: tap,
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: filledColor,
              border: Border.all(color: kmain),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          child: Center(
            child: Text(title!),
          ),
        ),
      ),
    );
  }
}
