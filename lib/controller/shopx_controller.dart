import 'package:get/state_manager.dart';
import 'package:getx_practice/model/shopx_model.dart';
import 'package:getx_practice/service/shopx_service.dart';

class ShopXcontroller extends GetxController{
  var productList=<ProductModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() async {
    var product=await ShopxService().fetchProduct();
    if(product != null){
      productList.value=product;
      print(productList);
    }
  }
}