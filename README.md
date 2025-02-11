🎬 Flutter Movie Booking App

A Flutter application that allows users to view movie details, select showtimes, and book seats.

📌 Features

Movie List & Details: Displays movie posters, ratings, and release dates.

Showtime Selection: Allows users to select a showtime before booking.

Seat Selection: Provides an interactive grid for selecting seats.

State Management: Uses Provider for managing selected seats.

Navigation: Seamless transition between screens using Navigator.

📱 Screens

1️⃣ Movie Detail Screen

Displays movie details, including the poster, rating, and release date.

Provides showtime selection.

Allows navigation to the Seat Selection Screen when a showtime is selected.

2️⃣ Seat Selection Screen

Displays available seats in a grid format.

Allows users to select and deselect seats.

Displays selected seats dynamically.

Confirms seat booking with a message.

🚀 Setup & Run

1️⃣ Clone the Repository

git clone https://github.com/your-username/flutter-movie-booking.git
cd flutter-movie-booking

2️⃣ Install Dependencies

flutter pub get

3️⃣ Run the App

flutter run


Future Improvements

Add API integration for fetching real movie data.

Implement payment gateway for booking confirmation.

Improve UI with animations and better styling.