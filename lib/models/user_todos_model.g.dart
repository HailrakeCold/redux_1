// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_todos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTodosModel _$UserTodosModelFromJson(Map<String, dynamic> json) =>
    UserTodosModel(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$UserTodosModelToJson(UserTodosModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
