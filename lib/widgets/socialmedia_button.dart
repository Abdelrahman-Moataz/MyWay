import 'package:flutter/material.dart';
import 'const.dart';

class SocialMedia extends StatelessWidget {
  final String? title;
  final void Function()? tap;
  final Color? filledColor;
  final IconData? ficone;

   const SocialMedia({
    this.title,
    this.filledColor,
    this.ficone,
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
            child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(ficone),
                const SizedBox(width: 8,),
                Text(title!),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
