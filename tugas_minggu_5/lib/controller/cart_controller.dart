import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/movie_ticket_model.dart';

class CartController extends GetxController {
  RxList listMovieTicket = <ModelMovieTicket>[].obs;

  void addTicket(
      {required int id, required String title, required String posterPath}) {
    listMovieTicket.add(
        ModelMovieTicket(id: id, title: title, posterPath: posterPath, qty: 1));
    Get.snackbar(
      "Success",
      "Success add to cart",
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      duration: Duration(seconds: 2),
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
    );
    print(listMovieTicket.length);
    update();
  }
  void removeTicket({required int id, required String title, required String posterPath}) {
    listMovieTicket.removeWhere((element) => element.id == id);
    Get.snackbar(
      "Success",
      "Success remove from cart",
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      duration: Duration(seconds: 2),
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
    );
    print(listMovieTicket.length);
    update();
  }
}
