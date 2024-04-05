import 'package:auth/interfaces/model_interface.dart';

class UserModel implements IModel {
  final int? id;
  final String name;
 
  final String password;

  UserModel(
      {this.id,
      required this.name,
      required this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        password: json['password']);
  }

  copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
  }) {
    return UserModel(
      name: this.name,
      password: password ?? this.password,
    );
  }

  static String getQuery() => """
  create table if not exists tb_user(
	      id serial primary key,
	      name VARCHAR(255),
	      password VARCHAR(255)
      );
      """;
}
