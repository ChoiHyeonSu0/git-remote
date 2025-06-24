import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triptest/providers/user_provider.dart';
import 'package:triptest/routes/app_routes.dart';
import 'package:triptest/screens/myinfo/myinfo_empty_state_widget.dart';
import 'package:triptest/screens/myinfo/myinfo_form_widget.dart';

class MyinfoScreen extends StatefulWidget {
  const MyinfoScreen({super.key});

  @override
  State<MyinfoScreen> createState() => _MyinfoScreenState();
}

class _MyinfoScreenState extends State<MyinfoScreen> {
  bool _showForm = false;
  
  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    if(userProvider.userInfo != null) {
      _showForm = true;
    }
  }
  
  void handleShowForm(bool shouldShow) {
    setState(() {
      _showForm = shouldShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("myInfo"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.home,
                  (route) => false
                );
              },
              icon: Icon(Icons.home)
          )
        ],
      ),
      body: Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            if(!userProvider.hasUserInfo && _showForm) {
              return MyinfoEmptyStateWidget(handleShowForm);
            }
            else {
              return MyInfoFormWidget();
            }
          }
      )
    );
  }
}
