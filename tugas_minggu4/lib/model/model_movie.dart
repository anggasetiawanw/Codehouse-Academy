class ModelMovie{
  late int id;
  late String title;
  late String poster_path;
  late String release_date;
  late String overview;

  ModelMovie({
    required this.id,
    required this.title,
    required this.poster_path,
    required this.release_date,
    required this.overview
  });

  factory ModelMovie.fromMap(Map<String,dynamic> map){
    return ModelMovie(
        id: map["id"],
        title:map["title"],
        poster_path: map["poster_path"],
        release_date: map["release_date"],
        overview: map["overview"]);
  }
}
