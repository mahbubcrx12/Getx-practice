import 'package:flutter/material.dart';
import 'package:getx_practice/controller/cart_controller.dart';
import 'package:getx_practice/controller/shopping_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                          margin: const EdgeInsets.all(12),
                          child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${controller.products[index].productName}',
                                              style: TextStyle(fontSize: 24),
                                            ),
                                            Text(
                                                '${controller.products[index].productDescription}'),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                                '\$${controller.products[index].price}',
                                                style: TextStyle(fontSize: 24)),
                                            ElevatedButton(
                                              onPressed: () {
                                                cartController.addToCart(
                                                    controller.products[index]);
                                              },
                                              child: Text('Add to Cart'),
                                            ),
                                          ],
                                        ),
                                        Obx(() => IconButton(onPressed: (){
                                          controller.products[index].isFavourate.toggle();
                                        },
                                            icon: controller.products[index].isFavourate.value
                                            ? Icon(Icons.check_box_rounded)
                                                :Icon(Icons.check_box_outline_blank_outlined)
                                        ))
                                      ],
                                    ),
                                  ])));
                    });
              }),
            ),
            // GetBuilder<CartController>(builder: (controller){
            //   return Text("Total ammount: \$ ${controller.testAmount}");
            // }),
            // GetX<CartController>(builder: (controller) {
            //   return Text(
            //     "Total ammount: ${controller.totalPrice}",
            //     style: TextStyle(fontSize: 20, color: Colors.white),
            //   );
            // }),
            Obx(() {
              return Text(
                      "Total ammount: ${cartController.totalPrice}",
                      style: TextStyle(fontSize: 20, color: Colors.white),);
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 100,
                ),
                FloatingActionButton(
                  isExtended: true,
                  onPressed: () {},
                  backgroundColor: Colors.red,
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                      ),

                      GetX<CartController>(builder: (controller) {
                        return Text(
                        controller.count.toString(),
                          style: TextStyle(color: Colors.white),
                        );
                      })
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
