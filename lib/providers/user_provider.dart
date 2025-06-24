import 'package:flutter/widgets.dart';
import 'package:triptest/models/user_info.dart';
import 'package:triptest/services/database_helper.dart';

class UserProvider with ChangeNotifier {
  UserInfo? _userInfo;
  UserInfo? get userInfo => _userInfo;

  bool get hasUserInfo => _userInfo != null &&
      (_userInfo!.name?.isNotEmpty == true || _userInfo!.email?.isNotEmpty == true);

  Future<void> loadUserData() async {
    _userInfo = await DatabaseHelper.instance.getUser();
    notifyListeners();
  }

  Future<void> updateUserInfo(UserInfo userInfo) async {
    await DatabaseHelper.instance.insertOrUpdateUser(userInfo);
    _userInfo = userInfo;
    notifyListeners();
  }
  Future<void> clearUserInfo() async {
    _userInfo = null;
    notifyListeners();
  }
}