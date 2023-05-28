import 'package:banda/group_of_lists/listofdesserts/ui_of_desserts.dart';
import 'package:flutter/material.dart';
import 'list_of_dessers_res.dart';




class MainDessertsPage extends StatefulWidget {
  const MainDessertsPage({Key? key}) : super(key: key);

  @override
  _MainDessertsPageState createState() => _MainDessertsPageState();
}

class _MainDessertsPageState extends State<MainDessertsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView.builder(
        primary: true,
          //padding: const EdgeInsets.all(10.0),
          itemCount: loadedItem.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 10 / 6,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5),
          itemBuilder: (ctx, i) => UIOfDesserts(
            rating: loadedItem[i].rating,
            title: loadedItem[i].title,
            imageURL: loadedItem[i].imageURL,
            id: loadedItem[i].id,
            phoneNum: loadedItem[i].phoneNum,
            description: loadedItem[i].description,



          )),
    );
  }
}