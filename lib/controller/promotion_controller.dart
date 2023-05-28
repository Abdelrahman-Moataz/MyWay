import 'package:banda/menu_stuff/promotion_stuff/promotion_model.dart';
import 'package:banda/menu_stuff/promotion_stuff/promotion_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PromotionController extends GetxController{

  var productList = <PromotionModels>[].obs;
  var isLoading = true.obs;
  var favList = <PromotionModels>[].obs;
  var storage = GetStorage();

  @override
  void onInit() {
    super.onInit();

    List? storedShopping = storage.read<List>("isFavList");

    if(storedShopping != null){
      favList = storedShopping.map((e) => PromotionModels.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts()async{
    var products   =  await PromotionService.getProduct();


    try{

      // we can type "isLoading.value = true;" will get the same result
      isLoading(true);

      if(products.isNotEmpty){
        productList.addAll(products);
      }

    } finally{
      isLoading(false);
    }

  }

  //logic for fav screen

  void manageFav(int productId)async{
    var existingIndex =  favList.indexWhere((element) => element.id == productId);


    if(existingIndex >= 0){
      favList.removeAt(existingIndex);
      await storage.remove("isFavList");
    }

    else{
      favList.add(productList.firstWhere((element) => element.id == productId));
      await storage.write("isFavList", favList);

    }
  }

  bool isFav(int productId){
    return  favList.any((element) => element.id == productId);

  }

}