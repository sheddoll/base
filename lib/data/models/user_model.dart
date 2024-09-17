import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 2)
class UserModel{
  @HiveField(0)
  final String ? email;
  @HiveField(1)
  final String ? password;

  const UserModel({this.email, this.password});

}