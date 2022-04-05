import 'package:get/get.dart';
import 'package:tugas_minggu_5/shared/movie_repo.dart';

import '../model/movie_model.dart';

class HomeController extends GetxController{
  MovieRepository movieRepository=Get.find<MovieRepository>();

  int page=1;
  RxList listMovie=<ModelMovie>[].obs;
  String urlImage="https://image.tmdb.org/t/p/w500";
  RxBool isNoLoadMore=false.obs;
  RxBool isLoading=false.obs;

  void callAPI(){
    isLoading.value=true;
    movieRepository.getMovie(page).then((List<ModelMovie> value){
      if(value.isEmpty){
        isNoLoadMore.value=true;
      }
      listMovie.addAll(value);
      isLoading.value=false;
    }).catchError((error,stackTrace){
      print(" error ${error}");
      print(" error ${stackTrace}");
    });
  }
  
  @override
  void onReady() {
    callAPI();
    // TODO: implement onReady
    super.onReady();
  }

}