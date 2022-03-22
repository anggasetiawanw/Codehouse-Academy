import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tugas_minggu4/model/model_movie.dart';
import 'package:tugas_minggu4/shared/service_movie.dart';


class MovieRepository {
  Future<List<ModelMovie>> getMovie(int page) async{
    http.Response value=await http.get(
        Uri.parse(ServiceServer.alamat_api+"/3/movie/top_rated?api_key=${ServiceServer.api_key}"+"&page=${page}"),
       );
    if(value.statusCode==200) {
      Map<String, dynamic>response = json.decode(value.body);
      List<dynamic>list_data= response["results"];
      List<ModelMovie>list_movie=list_data.
      map((dynamic element) => ModelMovie.fromMap(element)).toList();
      return list_movie;
    }else{
      throw Exception();
    }

  }
}