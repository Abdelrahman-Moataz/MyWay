import 'package:flutter/material.dart';

class SearchFiled extends StatelessWidget {
  const SearchFiled({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(

          prefixIcon: const Icon(Icons.search),
          hintText: "Search food",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),

          )
      ),
    );
  }
}
