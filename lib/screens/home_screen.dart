import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/api_services.dart';
import 'package:movie_app/widgets/carousal_widget.dart';
import 'package:movie_app/widgets/movie_card_widget.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topratedMovies;
  late Future<List<Movie>> upcomingMovies;
  @override
  void initState() {
    super.initState();
    trendingMovies = ApiServices().getTrendingMovies();
    topratedMovies = ApiServices().getTopRatedMovies();
    upcomingMovies = ApiServices().getUpComingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Image.asset(
            'assets/netflix-logo.webp',
            height: 80,
            width: 140,
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  child: FutureBuilder(
                      future: trendingMovies,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else if (snapshot.hasData) {
                          return Carousal_Widget_Screen(
                            snapshot: snapshot,
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: FutureBuilder(
                      future: topratedMovies,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 5.0,
                            ),
                          );
                        } else {
                          return Movie_Slider_Screen(
                            snapshot: snapshot,
                            headLineText: 'Top rated movies',
                          );
                        }
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: FutureBuilder(
                      future: upcomingMovies,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 5.0,
                            ),
                          );
                        } else {
                          return Movie_Slider_Screen(
                            snapshot: snapshot,
                            headLineText: 'Upcoming movies',
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
