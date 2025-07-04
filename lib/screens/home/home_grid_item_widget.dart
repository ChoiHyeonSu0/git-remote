import 'package:flutter/material.dart';
import 'package:triptest/models/trip_destination.dart';

class HomeGridItem extends StatelessWidget {
  TripDestination destination;
  HomeGridItem(this.destination);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Image.asset(
                 destination.imagePath,
                 fit: BoxFit.cover,
                ),
            ),
            Text(
              destination.name,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              destination.discount,
              style: TextStyle(fontSize: 12, color: Colors.black54),
            )
          ],
        ),
      )
      ,
    );
  }
}