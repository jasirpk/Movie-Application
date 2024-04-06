// import 'package:flutter/material.dart';
// import 'package:movie_app/screens/home_screen.dart';
// import 'package:movie_app/screens/new_and_hot.dart';
// import 'package:movie_app/screens/search_screen.dart';
// import 'package:movie_app/widgets/search_item.dart';

// class Bottom_Screen extends StatefulWidget {
//   const Bottom_Screen({super.key});

//   @override
//   State<Bottom_Screen> createState() => _Home_ScreenState();
// }

// class _Home_ScreenState extends State<Bottom_Screen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         bottomNavigationBar: Container(
//           color: Colors.black,
//           height: 70,
//           child: TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.home),
//                 text: "Home",
//               ),
//               Tab(
//                 icon: Icon(Icons.search),
//                 text: "Search",
//               ),
//               Tab(
//                 icon: Icon(
//                   Icons.photo_library_outlined,
//                 ),
//                 text: "New & Hot",
//               )
//             ],
//             indicatorColor: Colors.transparent,
//             labelColor: Colors.white,
//             unselectedLabelColor: Color(0xff999999),
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             Home_Screen(),SearchItemsScreen(searchResults: searchResults, imageUrl: imageUrl)
//             // Search_Screen(
//             //     // snapshot: AsyncSnapshot.waiting(),
//             //     ),
//             NewAndHot_Screen(),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// import 'package:movie_app/screens/home_screen.dart';
// import 'package:movie_app/screens/new_and_hot.dart';
// import 'package:movie_app/screens/search_screen.dart';
// import 'package:movie_app/widgets/search_item.dart';

// class BottomScreen extends StatefulWidget {
//   const BottomScreen({Key? key});

//   @override
//   State<BottomScreen> createState() => _BottomScreenState();
// }

// class _BottomScreenState extends State<BottomScreen> {

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         bottomNavigationBar: Container(
//           color: Colors.black,
//           height: 70,
//           child: TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.home),
//                 text: "Home",
//               ),
//               Tab(
//                 icon: Icon(Icons.search),
//                 text: "Search",
//               ),
//               Tab(
//                 icon: Icon(
//                   Icons.photo_library_outlined,
//                 ),
//                 text: "New & Hot",
//               )
//             ],
//             indicatorColor: Colors.transparent,
//             labelColor: Colors.white,
//             unselectedLabelColor: Color(0xff999999),
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             Home_Screen(),
//             Search_Screen(snapshot: ),
//             NewAndHot_Screen(),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/screens/new_and_hot.dart';
import 'package:movie_app/screens/search_screen.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({Key? key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  // Define your snapshot data here
  // For example, let's say you have a Future that retrieves some data
  late Future<List<String>> searchDataFuture;

  @override
  void initState() {
    super.initState();
    // Initialize your Future here, for example
    searchDataFuture = fetchSearchData();
  }

  Future<List<String>> fetchSearchData() async {
    // Simulate fetching data from somewhere
    await Future.delayed(Duration(seconds: 2));
    return ['Result 1', 'Result 2', 'Result 3'];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          height: 70,
          child: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.search),
                text: "Search",
              ),
              Tab(
                icon: Icon(
                  Icons.photo_library_outlined,
                ),
                text: "New & Hot",
              )
            ],
            indicatorColor: Colors.transparent,
            labelColor: Colors.white,
            unselectedLabelColor: Color(0xff999999),
          ),
        ),
        body: TabBarView(
          children: [
            Home_Screen(),
            // Pass the snapshot data to the Search_Screen
            FutureBuilder<List<String>>(
              future: searchDataFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Search_Screen(snapshot: snapshot);
                }
              },
            ),
            NewAndHot_Screen(),
          ],
        ),
      ),
    );
  }
}
