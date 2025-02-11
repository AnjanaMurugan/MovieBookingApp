import 'package:flutter/material.dart';
import 'package:moviebookingapp/providers/createseat.dart';
import 'package:moviebookingapp/screens/movie_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(

      ChangeNotifierProvider(create:(context)=>SeatProvider(),
    child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MovieListScreen(),
    );
  }
}


