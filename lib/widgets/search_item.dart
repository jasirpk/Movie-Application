import 'package:flutter/material.dart';
import 'package:movie_app/models/search.dart';
import 'package:movie_app/screens/detail_screen.dart';

class Search_Items_Screen extends StatelessWidget {
  const Search_Items_Screen({
    super.key,
    required this.snapshot,
    required this.searchResults,
    required this.imageUrl,
  });

  final List<SearchModel> searchResults;
  final String imageUrl;
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: SizedBox(
        height: 700,
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            crossAxisSpacing: 5,
            childAspectRatio: 1.2 / 2,
          ),
          itemCount: searchResults.length,
          itemBuilder: (context, index) {
            final result = searchResults[index];
            return InkWell(
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
              child: Column(
                children: [
                  Expanded(
                      child: result.movie == null
                          ? Image.network(
                              '$imageUrl${result.series!.posterImage}',
                              height: 170,
                            )
                          : Image.network(
                              result.series?.posterImage ??
                                  "assets/BrandAssets_Logos_02-NSymbol.jpg",
                              height: 170,
                            )),
                  SizedBox(
                    width: 100,
                    child: Text(
                      result.movie != null
                          ? result.movie!.title
                          : result.series!.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
