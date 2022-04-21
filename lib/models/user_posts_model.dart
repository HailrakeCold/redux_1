import 'package:json_annotation/json_annotation.dart';

part 'user_posts_model.g.dart';

@JsonSerializable()
class UserPostModel {
  int userId;
  int id;
  String title;
  String body;

  @override
  UserPostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory UserPostModel.fromJson(Map<String, dynamic> json) =>
      _$UserPostModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserPostModelToJson(this);
}
