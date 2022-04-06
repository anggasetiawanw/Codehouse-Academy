import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_minggu_5/controller/cart_controller.dart';

import '../widget/cart_card.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);
  late CartController controller;
  @override
  Widget build(BuildContext context) {
    controller = Get.find<CartController>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart Page'),
        ),
        body: Obx(() => ListView.builder(
              itemCount: controller.listMovieTicket.value.length,
              itemBuilder: (BuildContext context, int index) {
                if (index < controller.listMovieTicket.value.length) {
                  return CartCard(
                    movieTicket: controller.listMovieTicket.value[index],
                    index: index,
                  );
                } else {
                  return const Center(child: Text("TIKET BELUM DI PESAN"));
                }
              },
            )));
  }
}
