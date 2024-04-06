// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/search.dart';
import 'package:movie_app/services/api_services.dart';
import 'package:movie_app/widgets/popular_widget.dart';
import 'package:movie_app/widgets/search_item.dart';

class Search_Screen extends StatefulWidget {
  Search_Screen({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;
  @override
  State<Search_Screen> createState() => _SearchpageState();
}

class _SearchpageState extends State<Search_Screen> {
  TextEditingController searchcontroller = TextEditingController();
  List<SearchModel> searchResults = [];
  final imageUrl = 'https://image.tmdb.org/t/p/w500';
  late Future<List<Movie>> topratedMovies;

  void search(String query) {
    ApiServices().getSearchResults(query).then((results) {
      setState(() {
        searchResults = results;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    topratedMovies = ApiServices().getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CupertinoSearchTextField(
                  backgroundColor: Colors.white24,
                  controller: searchcontroller,
                  padding: EdgeInsets.all(10),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  suffixIcon: Icon(
                    Icons.cancel,
                    color: Colors.grey,
                  ),
                  style: TextStyle(color: Colors.white),
                  onChanged: search,
                ),
              ),
              searchcontroller.text.isEmpty
                  ? FutureBuilder(
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
                          return Popular_widget_Screen(
                            snapshot: snapshot,
                            headLineText: "Top Searched Movies",
                          );
                        }
                      })
                  : searchResults == null
                      ? SizedBox.shrink()
                      : Search_Items_Screen(
                          snapshot: widget.snapshot,
                          searchResults: searchResults,
                          imageUrl: imageUrl)
            ],
          ),
        ),
      ),
    );
  }
}
