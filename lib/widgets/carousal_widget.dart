import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/utils.dart';
import 'package:movie_app/screens/detail_screen.dart';

class Carousal_Widget_Screen extends StatelessWidget {
  const Carousal_Widget_Screen({
    super.key,
    required this.snapshot,
  });
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Trending Movies",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: CarouselSlider.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, itemIndex, pageIndex) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detail_Screen(
                          movie: snapshot.data[itemIndex],
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        "${Constants.imageUrl}${snapshot.data[itemIndex].posterPath}",
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      )),
                );
              },
              options: CarouselOptions(
                  height: 300,
                  aspectRatio: 16 / 9,
                  reverse: false,
                  viewportFraction: 0.55,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal)),
        ),
      ],
    );
  }
}
