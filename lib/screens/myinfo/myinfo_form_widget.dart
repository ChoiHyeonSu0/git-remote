import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:triptest/models/user_info.dart';
import 'package:triptest/providers/user_provider.dart';

class MyInfoFormWidget extends StatefulWidget {
  const MyInfoFormWidget({super.key});

  @override
  State<MyInfoFormWidget> createState() => _MyInfoFormWdState();
}

class _MyInfoFormWdState extends State<MyInfoFormWidget> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  String? profileImagePath;
  ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    if(userProvider.userInfo != null) {
      nameController.text = userProvider.userInfo!.name ?? '';
      emailController.text = userProvider.userInfo!.email ?? '';
      profileImagePath = userProvider.userInfo!.profileImagePath ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: profileImagePath != null ?
                  FileImage(File(profileImagePath!))
                  : AssetImage("assets/images/user_basic.jpg") as ImageProvider
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: FloatingActionButton(
                    mini: true,
                    onPressed: showImagePickerDialog,
                    child: Icon(Icons.camera_alt),
                  )
                )
              ],
            )
          ),
          SizedBox(height: 32),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: "이름",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person)
            ),
          ),
          SizedBox(height: 16,),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
                labelText: "이메일",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email)
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 16),
          ElevatedButton(
              onPressed: saveUserInfo,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16)
              ),
              child: Text("저장")
          )
        ],
      ),
    );
  }

  void showImagePickerDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('프로필 사진 선택'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text("카메라로 촬영"),
                  onTap: () {
                    Navigator.pop(context);
                    pickImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text("갤러리에서 선택"),
                  onTap: () {
                    Navigator.pop(context);
                    pickImage(ImageSource.gallery);
                  },
                )
              ],
            ),
          );
        }
    );
  }
  
  Future<void> pickImage(ImageSource source) async {
    try {
      XFile? image = await picker.pickImage(source: source);
      if(image != null) {
        setState(() {
          profileImagePath = image.path;
        });
      }
    }
    catch(e) {
      print(e);
    }
  }

  void saveUserInfo() async {
    if(nameController.text.trim().isEmpty && emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("이름 또는 이메일을 입력해주세요."))
      );
      return;
    }
    final userInfo = UserInfo(
      name: nameController.text.trim().isEmpty? null : nameController.text.trim(),
      email: emailController.text.trim().isEmpty ? null : emailController.text.trim(),
      profileImagePath: profileImagePath
    );

    try{
      await Provider.of<UserProvider>(context, listen: false).updateUserInfo(userInfo);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("사용자 정보가 저장되었습니다."))
      );
    }
    catch(e) {
      print(e);
    }
  }
}
