// ignore_for_file: unnecessary_null_comparison

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
                final selectedModel = searchResults[index];
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detail_Screen(
                      movie: selectedModel.movie!,
                    ),
                  ),
                );
                // if (selectedModel.movie != null) {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => Detail_Screen(
                //         movie: selectedModel.movie!,
                //       ),
                //     ),
                //   );
                // } else if (selectedModel.series != null) {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => Detail_Screen(
                //         series: selectedModel.series!,
                //       ),
                //     ),
                //   );
                // }
              },
              child: Column(
                children: [
                  Expanded(
                    child: result.movie != null
                        ? Image.network(
                            result.series?.posterImage != null
                                ? '$imageUrl${result.series!.posterImage}'
                                : 'assets/BrandAssets_Logos_02-NSymbol.jpg',
                            height: 170,
                          )
                        : Image.network(
                            result.series != null
                                ? result.series!.posterImage != null
                                    ? '$imageUrl${result.series!.posterImage}'
                                    : 'assets/BrandAssets_Logos_02-NSymbol.jpg'
                                : 'assets/BrandAssets_Logos_02-NSymbol.jpg',
                            height: 170,
                          ),
                  ),
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
