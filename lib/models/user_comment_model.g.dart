// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostCommentModel _$PostCommentModelFromJson(Map<String, dynamic> json) =>
    PostCommentModel(
      postId: json['postId'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      body: json['body'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$PostCommentModelToJson(PostCommentModel instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
