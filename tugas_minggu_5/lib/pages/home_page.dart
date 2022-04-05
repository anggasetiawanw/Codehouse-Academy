import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_minggu_5/widget/movie_card.dart';

import '../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  late HomeController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("List Movie For Booking"),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Obx(
            () => controller.listMovie.isEmpty
                ? Center(child: CircularProgressIndicator())
                : NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollNotification) {
                      if (scrollNotification.metrics.pixels ==
                          scrollNotification.metrics.maxScrollExtent) {
                        if (controller.isNoLoadMore.value == false) {
                          if (controller.isLoading.value == false) {
                            controller.page = controller.page + 1;
                            controller.callAPI();
                          }
                        }
                      }
                      return true;
                    },
                    child: ListView.builder(
                        itemCount: controller.isNoLoadMore.value == true
                            ? controller.listMovie.value.length
                            : controller.listMovie.value.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index < controller.listMovie.value.length) {
                            return MovieCard(
                                movie: controller.listMovie.value[index]);
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        }),
                  ),
          )),
    );
  }
}
