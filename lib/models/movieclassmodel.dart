

class MovieModel {
   final int id;
   final String title;
   final String posterUrl;
   final double rating;
   final DateTime releaseDate;

   MovieModel({
      required this.id,
      required this.title,
      required this.posterUrl,
      required this.rating,
      required this.releaseDate,
   });

   factory MovieModel.fromJson(Map<String, dynamic> json) {
      return MovieModel(
         id: json["id"],
         title: json["title"],
         posterUrl: json["posterurl"], // Match JSON key exactly
         rating: (json["rating"] as num).toDouble(),
         releaseDate: DateTime.parse(json["releaseDate"]), // Convert to DateTime
      );
   }
}


final List<Map<String, dynamic>> movieData = [
   {
      'id': 1,
      'title': "Movie1",
      "rating": 8.8,
      "releaseDate": "2024-09-10", // Correct date format (YYYY-MM-DD)
      "posterurl": "https://images.filmibeat.com/webp/ph-big/2024/07/lucky-baskhar1720716282_0.jpg"
   },
   {
      'id': 2,
      'title': "Movie2",
      "rating": 7.5,
      "releaseDate": "2023-08-15",
      "posterurl": "https://cdn.mos.cms.futurecdn.net/uzFbhsSymP6zdcWoPNVeXC.jpg"
   },
   {
      'id': 3,
      'title': "Movie3",
      "rating": 9.0,
      "releaseDate": "2022-06-20",
      "posterurl": "https://static.tnn.in/thumb/msid-104744561,thumbsize-62918,width-1280,height-720,resizemode-75/104744561.jpg"
   },
   {
      'id': 1,
      'title': "Movie1",
      "rating": 8.8,
      "releaseDate": "2024-09-10", // Correct date format (YYYY-MM-DD)
      "posterurl": "https://images.filmibeat.com/webp/ph-big/2024/07/lucky-baskhar1720716282_0.jpg"
   },
   {
      'id': 2,
      'title': "Movie2",
      "rating": 7.5,
      "releaseDate": "2023-08-15",
      "posterurl": "https://cdn.mos.cms.futurecdn.net/uzFbhsSymP6zdcWoPNVeXC.jpg"
   },
   {
      'id': 3,
      'title': "Movie3",
      "rating": 9.0,
      "releaseDate": "2022-06-20",
      "posterurl": "https://static.tnn.in/thumb/msid-104744561,thumbsize-62918,width-1280,height-720,resizemode-75/104744561.jpg"
   },
];
