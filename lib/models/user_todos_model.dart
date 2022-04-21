import 'package:json_annotation/json_annotation.dart';

part 'user_todos_model.g.dart';

@JsonSerializable()
class UserTodosModel {
  int userId;
  int id;
  String title;
  bool completed;

  @override
  UserTodosModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory UserTodosModel.fromJson(Map<String, dynamic> json) =>
      _$UserTodosModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserTodosModelToJson(this);
}
