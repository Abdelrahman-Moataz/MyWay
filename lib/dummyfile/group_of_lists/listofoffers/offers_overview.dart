import 'package:flutter/material.dart';



class OpenPageOfOffers extends StatelessWidget {


  const OpenPageOfOffers({super.key, required this.imageURL,required this.title,required this.rating});
  final String imageURL;
  final String title;
  final double rating;


  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text(title),),
    );



  }}