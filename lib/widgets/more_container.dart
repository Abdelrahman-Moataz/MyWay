import 'package:flutter/material.dart';



class MoreContainer extends StatelessWidget {

  final String? title;
  final IconData? iconed;
  final void Function()? tap;

   const MoreContainer({
     this.title,
     this.iconed,
     this.tap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Row(
        children: [
          Flexible(
            child: Container(height: 80,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.all(Radius.circular(15))
              ),
              child: Row(
                children:  [
                  const SizedBox(width: 15,),
                  CircleAvatar(backgroundColor: Colors.grey.shade400,maxRadius: 28,child: Icon(iconed),),
                  const SizedBox(width: 10,),
                  Text(title!),
                ],
              ),
            ),
          ),
          CircleAvatar(backgroundColor: Colors.grey.shade300,maxRadius: 15,child: const Icon(Icons.keyboard_arrow_right_rounded),)
        ],
      ),
    );
  }
}