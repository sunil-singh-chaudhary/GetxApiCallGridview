import 'package:getxdemoproject/Models/product_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>> fetchproductService() async {
    var response = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var jsonstring = response.body;
    return productFromJson(jsonstring);
  }
}
