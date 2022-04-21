import 'package:json_annotation/json_annotation.dart';

part 'album_photos_model.g.dart';

@JsonSerializable()
class AlbumPhotosModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  @override
  AlbumPhotosModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory AlbumPhotosModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumPhotosModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumPhotosModelToJson(this);
}
