// // ignore_for_file: unnecessary_null_comparison

// import 'package:flutter/material.dart';
// import 'package:movie_app/models/search.dart';

// class Search_Items_Screen extends StatelessWidget {
//   const Search_Items_Screen({
//     super.key,
//     required this.snapshot,
//     required this.searchResults,
//     required this.imageUrl,
//   });

//   final List<SearchModel> searchResults;
//   final String imageUrl;
//   final AsyncSnapshot snapshot;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 8, right: 8),
//       child: SizedBox(
//         height: 700,
//         child: GridView.builder(
//           shrinkWrap: true,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//             mainAxisSpacing: 15,
//             crossAxisSpacing: 5,
//             childAspectRatio: 1.2 / 2,
//           ),
//           itemCount: searchResults.length,
//           itemBuilder: (context, index) {
//             final result = searchResults[index];
//             return Column(
//               children: [
//                 Expanded(
//                   child: result.movie != null
//                       ? Image.network(
//                           result.series?.posterImage != null
//                               ? '$imageUrl${result.series!.posterImage}'
//                               : 'assets/BrandAssets_Logos_02-NSymbol.jpg',
//                           height: 170,
//                         )
//                       : Image.network(
//                           result.series != null
//                               ? result.series!.posterImage != null
//                                   ? '$imageUrl${result.series!.posterImage}'
//                                   : 'assets/BrandAssets_Logos_02-NSymbol.jpg'
//                               : 'assets/BrandAssets_Logos_02-NSymbol.jpg',
//                           height: 170,
//                         ),
//                 ),
//                 SizedBox(
//                   width: 100,
//                   child: Text(
//                     result.movie != null
//                         ? result.movie!.title
//                         : result.series!.name,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontSize: 12,
//                     ),
//                   ),
//                 )
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:movie_app/models/search.dart';

class Search_Items_Screen extends StatelessWidget {
  const Search_Items_Screen({
    Key? key,
    required this.snapshot,
    required this.searchResults,
    required this.imageUrl,
  }) : super(key: key);

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
            return Column(
              children: [
                Expanded(
                  child: Image.network(
                    _getImageUrl(result),
                    height: 170,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/BrandAssets_Logos_02-NSymbol.jpg',
                        height: 170,
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Text(
                    result.movie != null
                        ? result.movie!.title ??
                            result.series!.name ??
                            "Unknown"
                        : result.series!.name ??
                            result.movie!.title ??
                            "Unknown",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  String _getImageUrl(SearchModel result) {
    if (result.movie != null && result.movie!.posterPath != null) {
      return '$imageUrl${result.movie!.posterPath}';
    } else if (result.series != null && result.series!.posterImage != null) {
      return '$imageUrl${result.series!.posterImage}';
    } else {
      return 'assets/BrandAssets_Logos_02-NSymbol.jpg';
    }
  }
}
