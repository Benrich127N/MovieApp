import 'package:flutter/material.dart';
import 'package:movieapp/model/model_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //i'm going to create a dummy list of movies
  // you can build your own list, i used IMBD data

  static List<MovieModel> main_movies_list = [
    MovieModel("Far From Home", 2022, 5.8,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxCy-1HgbCygQO4V9Mzd43zEdU-o3n2hI13RT2bSaBhgeUUJs0ATbNHDPhXCVnTyqJWEY&usqp=CAU"),
    MovieModel("Home", 2015, 6.63,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxCy-1HgbCygQO4V9Mzd43zEdU-o3n2hI13RT2bSaBhgeUUJs0ATbNHDPhXCVnTyqJWEY&usqp=CAU"),
    MovieModel("Wednesday", 2022, 8.2,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxCy-1HgbCygQO4V9Mzd43zEdU-o3n2hI13RT2bSaBhgeUUJs0ATbNHDPhXCVnTyqJWEY&usqp=CAU"),
    MovieModel("Dune", 2021, 8.0,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxCy-1HgbCygQO4V9Mzd43zEdU-o3n2hI13RT2bSaBhgeUUJs0ATbNHDPhXCVnTyqJWEY&usqp=CAU"),
    MovieModel("Entergalactic", 2022, 7.4,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxCy-1HgbCygQO4V9Mzd43zEdU-o3n2hI13RT2bSaBhgeUUJs0ATbNHDPhXCVnTyqJWEY&usqp=CAU"),
    MovieModel("Troll", 2022, 5.8,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxCy-1HgbCygQO4V9Mzd43zEdU-o3n2hI13RT2bSaBhgeUUJs0ATbNHDPhXCVnTyqJWEY&usqp=CAU"),
    MovieModel("Day Shift", 2022, 6.1,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxCy-1HgbCygQO4V9Mzd43zEdU-o3n2hI13RT2bSaBhgeUUJs0ATbNHDPhXCVnTyqJWEY&usqp=CAU"),
    MovieModel("Extraction", 2020, 6.7,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxCy-1HgbCygQO4V9Mzd43zEdU-o3n2hI13RT2bSaBhgeUUJs0ATbNHDPhXCVnTyqJWEY&usqp=CAU"),
    MovieModel("John Wick", 2014, 7.4,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxCy-1HgbCygQO4V9Mzd43zEdU-o3n2hI13RT2bSaBhgeUUJs0ATbNHDPhXCVnTyqJWEY&usqp=CAU"),
    MovieModel("Kate", 2021, 6.2,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxCy-1HgbCygQO4V9Mzd43zEdU-o3n2hI13RT2bSaBhgeUUJs0ATbNHDPhXCVnTyqJWEY&usqp=CAU"),
    MovieModel("Carter", 2022, 5.1,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxCy-1HgbCygQO4V9Mzd43zEdU-o3n2hI13RT2bSaBhgeUUJs0ATbNHDPhXCVnTyqJWEY&usqp=CAU"),
    MovieModel("Lou", 2022, 6.1,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxCy-1HgbCygQO4V9Mzd43zEdU-o3n2hI13RT2bSaBhgeUUJs0ATbNHDPhXCVnTyqJWEY&usqp=CAU"),
  ];

  // creating the list that we're going to use
  List<MovieModel> display_list = List.from(main_movies_list);
  void updateList(String value) {
    // this is where the function that will filter our list
    // we will be back to this list later after a while
    // Now let's dwrite our search function
    setState(() {
      display_list = main_movies_list
          .where((element) =>
              element.movie_title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f1545),
      appBar: AppBar(
        backgroundColor: Color(0xFF1f1545),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search For a Movie",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff302360),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "eg: The Dark Knight",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.purple.shade900,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              // Now let's create a function to display a text in case we don't a result
              child: display_list.length == 0
                  ? Center(
                      child: Text(
                        "No Result Found",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: display_list.length,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        title: Text(
                          display_list[index].movie_title!,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${display_list[index].movie_release_year}',
                          style: TextStyle(
                            color: Colors.white60,
                          ),
                        ),
                        trailing: Text(
                          "${display_list[index].rating}",
                          style: TextStyle(color: Colors.amber),
                        ),
                        leading: Image.network(
                            display_list[index].movie_poster_url!),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
