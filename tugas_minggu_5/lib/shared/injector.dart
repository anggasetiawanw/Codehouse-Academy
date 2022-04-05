import 'package:get/get.dart';
import 'package:tugas_minggu_5/controller/cart_controller.dart';
import 'package:tugas_minggu_5/controller/home_controller.dart';
import 'package:tugas_minggu_5/controller/main_controller.dart';
import 'package:tugas_minggu_5/shared/movie_repo.dart';

class Injector extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainPageController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => MovieRepository());
    Get.lazyPut(() => CartController());
  }
}
