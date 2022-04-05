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
      margin: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            Server.urlImage + movieTicket.posterPath,
            width: 50,
            height: 80,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movieTicket.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () => cartController.removeTicket(
                      id: movieTicket.id,
                      title: movieTicket.title,
                      posterPath: movieTicket.posterPath),
                  child: Text("Remove from Ticket"),
                )
              ],
            ),
          ),
          Column(
            children: [
              GestureDetector(
                  onTap: () {
                    cartController.listMovieTicket.value[index].qty++;
                    Get.snackbar(
                      "Success",
                      "Success add to qty",
                      snackPosition: SnackPosition.BOTTOM,
                      isDismissible: true,
                      duration: Duration(seconds: 1),
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                    );
                  },
                  child: Icon(Icons.add)),
              SizedBox(
                height: 5,
              ),
              Obx(() => Text(
                  cartController.listMovieTicket.value[index].qty.toString())),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                  onTap: () {
                    if (cartController.listMovieTicket.value.length <= 1) {
                      cartController.removeTicket(
                          id: movieTicket.id,
                          title: movieTicket.title,
                          posterPath: movieTicket.posterPath);
                    } else {
                      cartController.listMovieTicket.value[index].qty--;
                    }
                  },
                  child: Icon(Icons.remove)),
            ],
          )
        ],
      ),
    );
  }
}
