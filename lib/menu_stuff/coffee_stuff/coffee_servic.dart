import 'package:http/http.dart' as http;
import '../widgets/string_validation.dart';
import 'coffee_model.dart';

class CoffeeService{

  static Future<List<CoffeeModels>> getProduct()async{
    var response = await http.get(Uri.parse('$coffeeUrl/coffee/hot'));

    if(response.statusCode == 200){
      var jsonData = response.body;
      return coffeeFromJson(jsonData);
    }else{
      return throw Exception("Failed to load product");
    }
  }
}