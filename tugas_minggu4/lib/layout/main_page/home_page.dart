import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_minggu4/model/model_movie.dart';
import 'package:tugas_minggu4/shared/movie_repo.dart';
import 'package:tugas_minggu4/shared/theme.dart';
import 'package:tugas_minggu4/widget/card_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ModelMovie> list_movie = [];
  bool isNoLoadMore = false;
  int page = 1;
  bool isLoading = true;
  String username = "";
  late SharedPreferences sharedPreferences;
  void getData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      username = sharedPreferences.getString("username")!;
    });
  }

  void callAPI() {
    isLoading = true;
    MovieRepository().getMovie(page).then((List<ModelMovie> value) {
      isLoading = false;
      if (value.isEmpty) {
        isNoLoadMore = true;
      }
      list_movie = [...list_movie, ...value];
      setState(() {});
    }).catchError((err, track) {
      print("Something wrong ${err} ${track}");
    });
  }

  void initState() {
    callAPI();
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 54,
                  width: 54,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/photo1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Hi, $username",
                    style: textStyle3.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Icon(Icons.notifications),
              ],
            ),
            SizedBox(height: 12),
            Text(
              "Welcome To",
              style: textStyle3.copyWith(fontWeight: medium),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "Our MovieApps",
                style: textStyle3.copyWith(fontWeight: medium),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Newest Movie",
              style: textStyle3.copyWith(fontSize: 12),
            )
          ],
        ),
      );
    }

    Widget body() {
      return Container(
        padding: EdgeInsets.all(10),
        child: list_movie.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollNotification) {
                  if (scrollNotification.metrics.pixels ==
                      scrollNotification.metrics.maxScrollExtent) {
                    if (isNoLoadMore == false) {
                      if (isLoading == false) {
                        page = page + 1;
                        callAPI();
                      }
                    }
                  }
                  return true;
                },
                child: ListView.builder(
                    itemCount: isNoLoadMore == true
                        ? list_movie.length
                        : list_movie.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index < list_movie.length) {
                        return CardTile(
                          modelMovie: list_movie[index],
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [header(), Expanded(child: body())],
        ),
      ),
    );
  }
}
