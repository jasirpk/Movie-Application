import 'package:flutter/material.dart';
import 'package:movie_app/common/utils.dart';
import 'package:movie_app/screens/detail_screen.dart';

class Movie_Slider_Screen extends StatelessWidget {
  const Movie_Slider_Screen(
      {super.key,
      required this.snapshot,
      required this.headLineText,
      required this.scrolDirection});
  final AsyncSnapshot snapshot;
  final String headLineText;
  final Axis scrolDirection;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headLineText,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ListView.builder(
              scrollDirection: scrolDirection,
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detail_Screen(
                          movie: snapshot.data[index],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: 200,
                        width: 150,
                        child: Image.network(
                          "${Constants.imageUrl}${snapshot.data![index].posterPath}",
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
