import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triptest/providers/trip_provider.dart';
import 'package:triptest/providers/user_provider.dart';
import 'package:triptest/routes/app_routes.dart';
import 'package:triptest/screens/home_screen.dart';
import 'package:triptest/screens/myinfo_screen.dart';
import 'package:triptest/services/database_helper.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.database;
  runApp(TripApp());
}

class TripApp extends StatelessWidget {
  const TripApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TripProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()..loadUserData())
      ],
      child: MaterialApp(
        title: "Trip App",
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.home,
        routes: {
          AppRoutes.home: (context) => HomeScreen(),
          AppRoutes.myInfo: (context) => MyinfoScreen()
        },
      ),
    );
  }
}
