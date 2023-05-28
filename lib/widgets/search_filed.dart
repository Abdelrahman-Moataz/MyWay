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


class SearchFromText extends StatelessWidget {
  const SearchFromText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      decoration:  InputDecoration(
        fillColor: Colors.white,
        focusColor: Colors.red,
        prefixIcon: const Icon(Icons.search,color: Colors.green,),
        hintText: "Search for what you want",
        hintStyle: const TextStyle(color: Colors.black45,fontSize: 12,fontWeight: FontWeight.w500),
        filled: true,

        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10)
        ),

        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10)
        ),

        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10)
        ),

        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10)
        ),

      ),
    );
  }
}
