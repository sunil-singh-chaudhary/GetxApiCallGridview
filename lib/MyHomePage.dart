import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:getxdemoproject/Controller/product_controller.dart';
import 'package:getxdemoproject/Models/product_model.dart';

class MyHomePage extends StatelessWidget {
  final product_controller productController = Get.put(product_controller());

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        foregroundColor: Colors.white,
        title: const Center(
            child: Text(
          "GETX Demo",
          style: TextStyle(color: Colors.white),
        )),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopify,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(5, 10, 15, 0),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Padding(padding: EdgeInsets.all(10)),
                const Expanded(
                  child: Text(
                    "ShopX ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontStyle: FontStyle.normal),
                  ),
                ),
                const Icon(Icons.sort),
                const SizedBox(
                  width: 5,
                  height: 5,
                ),
                const Icon(Icons.category)
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemCount: productController.productlist
                      .length, //controller use here then it will work
                  itemBuilder: (context, index) {
                    return Image.network(
                        productController.productlist[index].url!);
                  }),
            ),
          )
        ],
      ),
    );
  }
}
