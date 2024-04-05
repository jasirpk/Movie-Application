import 'package:flutter/material.dart';
import 'package:movie_app/screens/profile.dart';
import 'package:movie_app/widgets/coming_soon.dart';

class NewAndHot_Screen extends StatefulWidget {
  const NewAndHot_Screen({super.key});

  @override
  State<NewAndHot_Screen> createState() => _NewAndHot_ScreenState();
}

class _NewAndHot_ScreenState extends State<NewAndHot_Screen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "New & Hot",
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            Icon(
              Icons.cast,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Welcome_Netflix()));
                },
                child: Container(
                  color: Colors.blue,
                  height: 27,
                  width: 27,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
          bottom: TabBar(
            dividerColor: Colors.black,
            isScrollable: false,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            unselectedLabelColor: Colors.white,
            labelColor: Colors.black,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            tabs: [
              Tab(
                text: "  🍿 Coming Soon  ",
              ),
              Tab(
                text: "  🔥 Everyone's watching  ",
              )
            ],
          ),
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ComingSoonMovieWidget(
                  imageUrl:
                      "https://st1.bollywoodlife.com/wp-content/uploads/2023/09/310500-86.jpg",
                  overview:
                      'A labourer named Pushpa makes enemies as he rises in the world of red sandalwood smuggling. However, violence erupts when the police attempt to bring down his illegal business.',
                  logoUrl: "https://i.ytimg.com/vi/b--sJ9bjg_8/mqdefault.jpg",
                  month: "Aug",
                  day: "15",
                ),
                SizedBox(
                  height: 20,
                ),
                ComingSoonMovieWidget(
                  imageUrl:
                      'https://dnm.nflximg.net/api/v6/2DuQlx0fM4wd1nzqm5BFBi6ILa8/AAAAQW3KhTzzwSGnL6hXt07lrAbrv8MO9GIZRAm7naBznaTcnFvFE3QOZcfvv1NR5CciFvXX1wba5yyiBicRV_53GyllNKndV4ptlq-gl9N9QT8-a9R5e74t77UCxqOhGInKfMGdw2Jw5Snfj7EfzdiyxpQG.jpg?r=c24',
                  overview:
                      'Geralt of Rivia, a brooding professional monster hunter for hire also known as witcher, struggles to keep his humanity in a medieval dark fantasy world ruled by corrupt kings, queens and mages, where poverty, violence and intolerance are rampant, normal humans are sometimes worse than actual monsters and most jobs that ...',
                  logoUrl:
                      "https://static0.gamerantimages.com/wordpress/wp-content/uploads/2022/09/The-Witcher-and-Blood-Origin-Release-Dates-Revealed.jpg",
                  month: "Jun",
                  day: "27",
                ),
                ComingSoonMovieWidget(
                  imageUrl:
                      'https://www.mp4moviez.tl/cover/godzilla-x-kong:-the-new-empire-(2024)-hollywood-english-movie.jpg',
                  overview:
                      'Godzilla and the almighty Kong face a colossal threat hidden deep within the planet, challenging their very existence and the survival of the human race.',
                  logoUrl:
                      "https://nonstopnerd748323109.files.wordpress.com/2021/01/gvk-1.jpg?w=1024",
                  month: "March",
                  day: "29",
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: ComingSoonMovieWidget(
              imageUrl:
                  'https://www.mp4moviez.tl/cover/godzilla-x-kong:-the-new-empire-(2024)-hollywood-english-movie.jpg',
              overview:
                  'Godzilla and the almighty Kong face a colossal threat hidden deep within the planet, challenging their very existence and the survival of the human race.',
              logoUrl:
                  "https://nonstopnerd748323109.files.wordpress.com/2021/01/gvk-1.jpg?w=1024",
              month: "March",
              day: "29",
            ),
          ),
        ]),
      ),
    );
  }
}
