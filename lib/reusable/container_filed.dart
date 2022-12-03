import 'package:flutter/material.dart';

import 'const.dart';


class FiledContainer extends StatelessWidget {

  String? title;
  String? body;

   FiledContainer({
     this.title,
     this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30,right: 30),
      child: Container(
        height: 50,width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: const BorderRadius.all(Radius.circular(30))
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30,top: 6),
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(title!,style: const TextStyle(color: Colors.blue)),
              Text(body!)
            ],
          ),
        ),
      ),
    );
  }
}
