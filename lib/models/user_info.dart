class UserInfo {
  String? name;
  String? email;
  String? profileImagePath;

  UserInfo({
    this.name, this.email, this.profileImagePath
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "profileImagePath": profileImagePath
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      name: map['name'],
      email: map['email'],
      profileImagePath: map['profileImagePath']
    );
  }
}