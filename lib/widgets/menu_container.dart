import 'package:flutter/material.dart';
import 'package:banda/reusable/const.dart';

class MenuContainer extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? nPic;
  final void Function()? tap;

  const MenuContainer({
    this.title,
    this.subTitle,
    this.nPic,
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
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    maxRadius: 35,
                    child: Image.asset(nPic!),
                  ),
                  const SizedBox(
                    width: 20,
                  ),

                  Column( mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title!,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      const SizedBox(height: 5,),
                      Text(subTitle!,style: const TextStyle(fontSize: 12,color: Colors.grey),),
                    ],
                  )

                ],
              ),
            ),
          ),
          //CircleAvatar(backgroundColor: Colors.white,maxRadius: 15,child: const Icon(Icons.keyboard_arrow_right_rounded),),

          Container(
            decoration: BoxDecoration(
              color: AppColors.kMain,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 15,
                    color: Colors.grey.shade400,
                    spreadRadius: 5)
              ],
            ),
            child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 15.0,
                child: Icon(Icons.keyboard_arrow_right_rounded)),
          ),
        ],
      ),
    );
  }
}
