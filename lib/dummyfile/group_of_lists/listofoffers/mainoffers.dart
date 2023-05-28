
import 'package:banda/group_of_lists/listofoffers/ui_of_offers.dart';
import 'package:flutter/material.dart';
import 'list_of_offers.dart';




class MainPageOfOffers extends StatefulWidget {
  const MainPageOfOffers({Key? key}) : super(key: key);

  @override
  _MainPageOfOffersState createState() => _MainPageOfOffersState();
}

class _MainPageOfOffersState extends State<MainPageOfOffers> {

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
          itemBuilder: (ctx, i) => UiOfOffersPage(
            rating: loadedItem[i].rating,
            title: loadedItem[i].title,
            imageURL: loadedItem[i].imageURL,
            id: loadedItem[i].id,
            phoneNum: loadedItem[i].phoneNum,



          )),
    );
  }
}