import 'package:flutter/material.dart';


class OpenPageOfDesserts extends StatelessWidget {


  const OpenPageOfDesserts({super.key, required this.imageURL,required this.title,required this.rating, required this.description, required this.phoneNum});
  final String imageURL;
  final String title;
  final double rating;
  final String description;
  final String phoneNum;



  @override

  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(child: Text(title,style: const TextStyle(fontSize: 20)))
          ],
        ),
      ),
    );



  }}



