import 'package:flutter/material.dart';

import 'const.dart';

class TopIcons extends StatelessWidget {
  String? title;
  String? iconPic;

  TopIcons({
    this.title,
    this.iconPic,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    image: NetworkImage(iconPic!), fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 5,
          ),
          Text((title!))
        ],
      ),
    );
  }
}
