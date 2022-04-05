import 'package:get/get.dart';
import 'package:tugas_minggu_5/pages/main_page.dart';

class PagesRoute {
  static final pages = [
    GetPage(
      name: '/main',
      page: () =>  MainPage(),
    ),
  ];
}
