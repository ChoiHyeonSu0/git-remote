import 'package:flutter/material.dart';
import 'package:triptest/models/trip_destination.dart';
import 'package:triptest/screens/home/home_grid_item_widget.dart';

class HomeGridWidget extends StatelessWidget {
  List<TripDestination> destinations;
  HomeGridWidget(this.destinations);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.1
      ),
      itemCount: destinations.length,
      itemBuilder: (context, index) {
        var destination = destinations[index];
        return GestureDetector(
          onTap: () {},
          child: HomeGridItem(destination),
        );
      }
    );
  }
}
