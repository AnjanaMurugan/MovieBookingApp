import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviebookingapp/models/movieclassmodel.dart';
import 'package:moviebookingapp/screens/seatselectionscreen.dart';
import 'package:moviebookingapp/screens/showtime.dart';

class MovieDetailScreen extends StatefulWidget {

  final  MovieModel movie;
  MovieDetailScreen({super.key, required this.movie});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                widget.movie.posterUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: Icon(Icons.movie, size: 50, color: Colors.grey[600]),
                  );
                },
              ),
              title: Text(widget.movie.title),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 4),
                      Text(
                        "${widget.movie.rating}",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Expanded(
                        child: Text(
                          "Release Date",
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Show Times",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  ShowtimeSelection(
                    onSelect: (time) {
                      print("Selected time: $time");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SeatSelectionScreen()),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SeatSelectionScreen()),
                        );
                      },
                      child: Text("Book Now"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


