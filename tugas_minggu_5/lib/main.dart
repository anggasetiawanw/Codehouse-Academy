import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_minggu_5/pages/main_page.dart';
import 'package:tugas_minggu_5/shared/injector.dart';
import 'package:tugas_minggu_5/shared/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      getPages: PagesRoute.pages,
      initialBinding: Injector(),
      home: const MainPage(),
    );
  }
}
