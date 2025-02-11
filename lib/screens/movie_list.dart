
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/movieclassmodel.dart';
import 'moviedetail.dart';

class MovieListScreen extends StatefulWidget {
  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  late List<MovieModel> movies;
  late List<MovieModel> filteredMovies;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    movies = movieData.map((json) => MovieModel.fromJson(json)).toList();
    filteredMovies = List.from(movies);

    _searchController.addListener(() {
      filterMovies(_searchController.text);
    });

    print("Movies Loaded: ${movies.length}"); // Debugging
  }

  void filterMovies(String query) {
    setState(() {
      filteredMovies = movies
          .where((movie) => movie.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movies')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search movies...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: filteredMovies.isEmpty
                ? Center(child: Text('No movies found'))
                : ListView.builder(
              itemCount: filteredMovies.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredMovies[index].title),
                  leading: Image.network(
                    filteredMovies[index].posterUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: Icon(Icons.movie, size: 50, color: Colors.grey[600]),
                      );
                    },
                  ),
                  subtitle: Text("Rating: ${filteredMovies[index].rating}"),
                   onTap: (){
                Navigator.push(context,

                MaterialPageRoute(builder: (context)=> MovieDetailScreen(movie:filteredMovies[index])
                ),
                );
              },
                );
              },


            ),
          ),
        ],
      ),
    );
  }
}
