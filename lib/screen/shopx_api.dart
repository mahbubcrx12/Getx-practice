import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controller/shopx_controller.dart';
import 'package:getx_practice/model/shopx_model.dart';

class ShopX extends StatelessWidget {

final ShopXcontroller shopXcontroller=Get.put(ShopXcontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Icon(Icons.arrow_back_ios),
          Icon(Icons.shopping_cart)
          ],),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Text("ShopX",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Spacer(),
            Icon(Icons.view_list_rounded),
            SizedBox(width: 10,),
            Icon(Icons.grid_view)
          ],),
        ),
        Expanded(
            child:Obx(()=>GridView.builder(

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                    crossAxisSpacing: 0,
                mainAxisSpacing: 2,
                
              ),
              itemCount: shopXcontroller.productList.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(left: 4,right: 4),
                  child: Card(
                    child: Container(
                      height: 150,
                      width: 100,

                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Expanded(child: Image.network("${shopXcontroller.productList[index].imageLink}",
                                fit: BoxFit.cover,width: double.infinity,),),
                              Text("${shopXcontroller.productList[index].name}"),
                              SizedBox(height: 8),
                              if ("${shopXcontroller.productList[index].rating}" != null)
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,

                                    children: [
                                      Text(
                                        "${shopXcontroller.productList[index].rating}".toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text('\$${shopXcontroller.productList[index].price}',
                                    style: TextStyle(fontSize: 22, fontFamily: 'avenir')),

                            ],),
                            Positioned(
                              right: 0,
                                bottom: 1,
                                child: Center(
                                  child: IconButton(
                                      onPressed: (){},
                                  icon: Icon(Icons.favorite_border_outlined,color: Colors.red,size: 30,)
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
        ),
            )
        )
      ],),
    ));
  }
}
