import 'package:get/get.dart';
import 'package:getx_practice/model/product.dart';

class CartController extends GetxController{
  var cartItems=<Product>[].obs;
int get count=>cartItems.length;
  double get totalPrice=>cartItems.fold(0, (previousValue, element) => previousValue+element.price);
// var testAmount=0.0;
  addToCart(Product product){
    cartItems.add(product);
    // testAmount= totalPrice;
    // update();
  }
}