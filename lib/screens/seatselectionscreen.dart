import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/createseat.dart';

// SeatProvider for managing selected seats

class SeatSelectionScreen extends StatelessWidget {
  final List<String> seats = [
    "A1", "A2", "A3", "A4", "A5",
    "B1", "B2", "B3", "B4", "B5",
    "C1", "C2", "C3", "C4", "C5"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Your Seats"), backgroundColor: Colors.indigo),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Seat Grid
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, // 5 seats per row
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.2,
                ),
                itemCount: seats.length,
                itemBuilder: (context, index) {
                  return Consumer<SeatProvider>(
                    builder: (context, seatProvider, child) {
                      bool isSelected = seatProvider.selectedSeats.contains(seats[index]);
                      return GestureDetector(
                        onTap: () {
                          seatProvider.toggleSeat(seats[index]);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.green : Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            seats[index],
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            SizedBox(height: 20),

            // Selected Seats Display
            Consumer<SeatProvider>(
              builder: (context, seatProvider, child) {
                return Text(
                  "Selected Seats: ${seatProvider.selectedSeats.join(", ")}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                );
              },
            ),

            SizedBox(height: 16),

            // Book Now Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final selectedSeats = context.read<SeatProvider>().selectedSeats;
                  if (selectedSeats.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please select at least one seat!")),
                    );
                    return;
                  }
                  // Navigate or show confirmation
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Booking confirmed for seats: ${selectedSeats.join(", ")}")),
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
    );
  }
}
