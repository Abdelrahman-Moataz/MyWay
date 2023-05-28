class MethodOfOffers {
  final String id;
  final double price;
  final String title;
  bool fav = false;
  final String describtion;
  final String imageURL;
  final double rating;
  final int    phoneNum;


  MethodOfOffers({
    required this.id,
    required this.price,
    required this.title,
    this.fav = false,
    required this.describtion,
    required this.imageURL,
    required this.rating,
    required this.phoneNum,
  });

}