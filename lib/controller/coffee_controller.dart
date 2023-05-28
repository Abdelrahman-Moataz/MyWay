import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'coffee_model.dart';
import 'coffee_servic.dart';


class CoffeeController extends GetxController{

  var productList = <CoffeeModels>[].obs;
  var isLoading = true.obs;
  var favList = <CoffeeModels>[].obs;
  var storage = GetStorage();

  @override
  void onInit() {
    super.onInit();

    List? storedShopings = storage.read<List>("isFavList");

    if(storedShopings != null){
      favList = storedShopings.map((e) => CoffeeModels.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts()async{
    var products   =  await CoffeeService.getProduct();


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