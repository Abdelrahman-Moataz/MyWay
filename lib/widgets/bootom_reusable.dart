import 'package:flutter/material.dart';

import 'const.dart';

class BottonReuseable extends StatelessWidget {
  final String? title;
  final void Function()? tap;
  final Color? filledColor;

  const BottonReuseable({
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
              border: Border.all(color: AppColors.kMain),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          child: Center(
            child: Text(title!),
          ),
        ),
      ),
    );
  }
}
