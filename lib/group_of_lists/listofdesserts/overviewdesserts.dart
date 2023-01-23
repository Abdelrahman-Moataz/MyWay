import 'package:flutter/material.dart';



class OpenPageOfRes extends StatelessWidget {


  const OpenPageOfRes({required this.imageURL,required this.title,required this.rating});
  final String imageURL;
  final String title;
  final double rating;


  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Center(child: Text(title,style: const TextStyle(fontSize: 20)))
        ],
      ),
    );



  }}