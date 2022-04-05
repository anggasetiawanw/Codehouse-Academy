import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_minggu_5/controller/main_controller.dart';
import 'package:tugas_minggu_5/pages/cart_page.dart';
import 'package:tugas_minggu_5/pages/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex.value,
              children: [
                HomePage(),
                CartPage(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 30,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex.value,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home,
                    color: controller.tabIndex.value == 0
                        ? Colors.white
                        : Colors.grey),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag,
                    color: controller.tabIndex.value == 1
                        ? Colors.white
                        : Colors.grey),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
