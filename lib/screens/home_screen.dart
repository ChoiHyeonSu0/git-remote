import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triptest/providers/trip_provider.dart';
import 'package:triptest/screens/home/home_drawer_widget.dart';
import 'package:triptest/screens/home/home_grid_widget.dart';
import 'package:triptest/screens/home/home_middle_widget.dart';

import 'home/home_top_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Trip App"),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
            ],
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 1
        ),
        body: Column(
            children: [
              HomeTopWidget(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      HomeMiddleWidget(),
                      SizedBox(height: 16,),
                      Expanded(
                          child: Consumer<TripProvider>(
                              builder: (context, tripProvider, child) {
                                return HomeGridWidget(tripProvider.destinations);
                              }
                          )
                      )
                    ],
                  ),
                )
              )
            ]
        ),
      drawer: HomeDrawer(),
    );
  }
}



