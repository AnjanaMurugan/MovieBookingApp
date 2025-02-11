import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowtimeSelection extends StatefulWidget {
  final Function onSelect;
  ShowtimeSelection({super.key, required this.onSelect});

  @override
  State<ShowtimeSelection> createState() => _ShowtimeSelectionState();
}

class _ShowtimeSelectionState extends State<ShowtimeSelection> {
  List<String> showtimes = ['Morning', 'Afternoon', 'Evening', 'Night'];
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: showtimes.map((time) {
        return ChoiceChip(
          label: Text(time),
          selected: selectedItem == time,
          onSelected: (selected) {
            setState(() {
              selectedItem = selected ? time : null;
            });
          },
        );
      }).toList(), // Convert Iterable to List<Widget>
    );
  }
}

