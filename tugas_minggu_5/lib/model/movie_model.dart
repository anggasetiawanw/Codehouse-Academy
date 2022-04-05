class ModelMovie{
  late int id;
  late String title;
  late String posterPath;
  late String releaseDate;
  late String overview;

  ModelMovie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.overview
  });

  factory ModelMovie.fromMap(Map<String,dynamic> map){
    return ModelMovie(
        id: map["id"],
        title:map["title"],
        posterPath: map["poster_path"],
        releaseDate: map["release_date"],
        overview: map["overview"]);
  }
}