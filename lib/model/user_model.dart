class UserModel {
  static const String collectionName = 'Users';
  String uId;
  String name;
  String email;

  UserModel({required this.uId, required this.email, required this.name});

  UserModel.fromJson(Map<String, dynamic> data)
    : this(
        uId: data['id'] as String,
        name: data['name'] as String,
        email: data['email'] as String,
      );

  Map<String, dynamic> toJson() {
    return {'id': uId, 'email': email, 'name': name};
  }
}
