import 'package:get/state_manager.dart';
import 'package:getxdemoproject/Models/product_model.dart';
import 'package:getxdemoproject/services/remote_services.dart';

class product_controller extends GetxController {
  var productlist = <Product>[].obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    var products = await RemoteServices.fetchproductService();
    productlist.value = products;
  }
}
