class MethodOfDesserts {
  final String id;
  final double price;
  final String title;
  bool fav = false;
  final String description;
  final String imageURL;
  final double rating;
  final String phoneNum;


  MethodOfDesserts({
    required this.id,
    required this.price,
    required this.title,
    this.fav = false,
    required this.description,
    required this.imageURL,
    required this.rating,
    required this.phoneNum,
  });

}