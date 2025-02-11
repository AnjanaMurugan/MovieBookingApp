


import 'package:flutter/material.dart';

class SeatProvider with ChangeNotifier {
  List<String> _selectedSeats = [];

  // Getter for selected seats
  List<String> get selectedSeats => _selectedSeats;

  void toggleSeat(String seat){
    if(_selectedSeats.contains(seat)){
      _selectedSeats.remove(seat);
    }else{
      _selectedSeats.add(seat);
    }
    notifyListeners();
  }


}