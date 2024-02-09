import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection:
          Axis.horizontal, // Set the scroll direction to horizontal
      itemCount: 10, // Number of items in the list
      itemBuilder: (BuildContext context, int index) {
        // Builder function for creating each item
        return Container(
          width: 100.0, // Set the width of each item
          margin: const EdgeInsets.all(8.0), // Add some margin for spacing
          color: Colors.blue, // Set the background color of each item
          child: Center(
            child: Text(
              'Item $index',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
