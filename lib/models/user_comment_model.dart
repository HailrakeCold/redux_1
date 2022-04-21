import 'package:json_annotation/json_annotation.dart';

part 'user_comment_model.g.dart';

@JsonSerializable()
class PostCommentModel {
  int postId;
  int id;
  String name;
  String email;
  String body;

  @override
  PostCommentModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.body,
    required this.email,
  });

  factory PostCommentModel.fromJson(Map<String, dynamic> json) =>
      _$PostCommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostCommentModelToJson(this);
}
