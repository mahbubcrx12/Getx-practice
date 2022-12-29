import 'package:get/get.dart';
import 'package:getx_practice/model/product.dart';

class ShoppingController extends GetxController{
  var products=<Product>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async{
    await Future.delayed(Duration(seconds: 1));

    var productResult=[
      Product(
      id:1,
      productName:"product 1",
      productImage:"image khuje pai ni",
      productDescription:"keu janena eita ki",
      price:10
      ),
      Product(
          id:2,
          productName:"product 2",
          productImage:"image ache but dilam na",
          productDescription:"janar ki dorkar",
          price:20
      ),
      Product(
          id:3,
          productName:"product 3",
          productImage:"dite chaisilam but time nai",
          productDescription:"jaina ki oibo",
          price:30
      ),
      Product(
          id:4,
          productName:"product 4",
          productImage:"dichi but dekha jaina",
          productDescription:"image e nai details dia ki korbi",
          price:40
      ),

    ];
    products.value=productResult;
  }
}