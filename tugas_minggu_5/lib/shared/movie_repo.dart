import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tugas_minggu_5/shared/server.dart';

import '../model/movie_model.dart';

class MovieRepository{
  Future<List<ModelMovie>>getMovie(int page)async{
    http.Response value=await http.get(Uri.parse(Server.urlApi+"movie/top_rated?api_key=${Server.apiKey}"+"&page=$page"));
    if(value.statusCode==200) {
      Map<String, dynamic>response = json.decode(value.body);
      List<dynamic>listData= response["results"];
      List<ModelMovie>listMovie=listData.
      map((dynamic element) => ModelMovie.fromMap(element)).toList();
      return listMovie;
    }else{
      throw Exception();
    }
  }
}