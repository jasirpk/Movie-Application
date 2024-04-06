import 'package:flutter/material.dart';
import 'package:movie_app/common/utils.dart';
import 'package:movie_app/screens/detail_screen.dart';

class Popular_widget_Screen extends StatelessWidget {
  const Popular_widget_Screen({
    super.key,
    required this.snapshot,
    required this.headLineText,
  });
  final AsyncSnapshot snapshot;
  final String headLineText;

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
        ListView.builder(
          itemCount: snapshot.data.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Detail_Screen(movie: snapshot.data[index])));
              },
              child: Container(
                height: 150,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Image.network(
                      "${Constants.imageUrl}${snapshot.data![index].posterPath}",
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: SizedBox(
                        width: 260,
                        child: Text(
                          snapshot.data[index].title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
