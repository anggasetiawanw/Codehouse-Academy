import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:tugas_minggu4/layout/main_page/home_page.dart';

import 'profile_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget buildContent(int curren) {
      switch (curren) {
        case 0:
          return const HomePage();
        case 1:
          return const ProfilePage();
        default:
      }
      return const Center(
        child: Text("Home Page"),
      );
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: buildContent(currentIndex),
    );
  }
}
