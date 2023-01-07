import 'package:flutter/material.dart';
import 'package:banda/try/list_of_popular_res.dart';
import 'package:banda/try/ui_of_main_page.dart';



class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView.builder(
          //padding: const EdgeInsets.all(10.0),
          itemCount: loadedItem.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 10 / 6,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (ctx, i) => UIOfMainPage(
            rating: loadedItem[i].rating,
            title: loadedItem[i].title,
            imageURL: loadedItem[i].imageURL,
            id: loadedItem[i].id,
            phoneNum: loadedItem[i].phoneNum,



          )),
    );
  }
}