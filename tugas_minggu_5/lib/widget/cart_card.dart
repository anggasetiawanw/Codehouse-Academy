import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_minggu_5/controller/cart_controller.dart';
import 'package:tugas_minggu_5/model/movie_ticket_model.dart';

import '../shared/server.dart';

class CartCard extends StatelessWidget {
  final int index;
  final ModelMovieTicket movieTicket;
  CartCard({
    Key? key,
    required this.movieTicket,
    required this.index,
  }) : super(key: key);
  late CartController cartController;
  @override
  Widget build(BuildContext context) {
    cartController = Get.find<CartController>();
    return Container(
      margin: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            Server.urlImage + movieTicket.posterPath,
            width: 50,
            height: 80,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movieTicket.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () => cartController.removeTicket(
                      id: movieTicket.id,
                      title: movieTicket.title,
                      posterPath: movieTicket.posterPath),
                  child: const Text("Remove from Ticket"),
                )
              ],
            ),
          ),
          Column(
            children: [
              GestureDetector(
                  onTap: () {
                    cartController.listMovieTicket.value[index].qty++;
                     cartController.listMovieTicket.refresh();
                    Get.snackbar(
                      "Success",
                      "Success add to qty",
                      snackPosition: SnackPosition.BOTTOM,
                      isDismissible: true,
                      duration: const Duration(seconds: 1),
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                    );
                  },
                  child: const Icon(Icons.add)),
              const SizedBox(
                height: 5,
              ),
              Obx(() => Text(
                  cartController.listMovieTicket.value[index].qty.toString())),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                  onTap: () {
                    if (cartController.listMovieTicket.value.length <= 1) {
                      cartController.removeTicket(
                          id: movieTicket.id,
                          title: movieTicket.title,
                          posterPath: movieTicket.posterPath);

                        cartController.listMovieTicket.refresh();
                    } else {
                      cartController.listMovieTicket.value[index].qty--;
                       cartController.listMovieTicket.refresh();
                    }
                  },
                  child: const Icon(Icons.remove)),
            ],
          )
        ],
      ),
    );
  }
}
