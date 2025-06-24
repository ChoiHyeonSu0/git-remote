import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triptest/routes/app_routes.dart';

import '../../providers/user_provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Consumer<UserProvider>(
            builder: (context, userProvider, child) {
              return UserAccountsDrawerHeader(
                accountName: Text(userProvider.userInfo?.name ?? "홍길동"),
                accountEmail: Text(userProvider.userInfo?.email ?? "user@example.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: userProvider.userInfo?.profileImagePath != null
                      ? FileImage(File(userProvider.userInfo!.profileImagePath!))
                  : AssetImage("assets/images/user_basic.jpg"),
                ),
                decoration: BoxDecoration(color: Colors.blue),
              );
            }
          ),

          ListTile(
            leading: Icon(Icons.info),
            title: Text("About"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("My Info"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AppRoutes.myInfo);
            },
          )

        ],
      ),
    );
  }
}
