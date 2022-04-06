import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_minggu_5/controller/cart_controller.dart';
import 'package:tugas_minggu_5/model/movie_model.dart';
import 'package:tugas_minggu_5/shared/server.dart';

class MovieCard extends StatelessWidget {
  late ModelMovie movie;
  MovieCard({required this.movie});
  late CartController cartController;

  @override
  Widget build(BuildContext context) {
    cartController = Get.find<CartController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            Server.urlImage + movie.posterPath,
            width: 100,
            height: 150,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(movie.releaseDate),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  movie.overview,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                ElevatedButton(
                  onPressed: () => cartController.addTicket(
                      id: movie.id,
                      title: movie.title,
                      posterPath: movie.posterPath),
                  child: const Text("Add to Ticket"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
