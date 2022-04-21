// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_photos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumPhotosModel _$AlbumPhotosModelFromJson(Map<String, dynamic> json) =>
    AlbumPhotosModel(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );

Map<String, dynamic> _$AlbumPhotosModelToJson(AlbumPhotosModel instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
