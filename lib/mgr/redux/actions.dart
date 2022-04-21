import 'package:test_redux_1/models/album_model.dart';
import 'package:test_redux_1/models/album_photos_model.dart';
import 'package:test_redux_1/models/user_comment_model.dart';
import 'package:test_redux_1/models/user_model.dart';
import 'package:test_redux_1/models/user_posts_model.dart';
import 'package:test_redux_1/models/user_todos_model.dart';

class UpdateAction {
  List<UserModel>? userLIst;
  List<AlbumModel>? userAlbumList;
  List<UserPostModel>? userPostList;
  List<UserTodosModel>? userTodos;
  List<AlbumPhotosModel>? albumPhotosList;
  List<PostCommentModel>? getPostsComments;
  int? selectedId;
  int? selectedPhoto;
  UpdateAction({
    this.userLIst,
    this.userAlbumList,
    this.userPostList,
    this.userTodos,
    this.albumPhotosList,
    this.getPostsComments,
    this.selectedId,
    this.selectedPhoto,
  });
}

class GetUsersAction {}

class GetAlbumPhotosAction {
  int albumId;
  GetAlbumPhotosAction({
    required this.albumId,
  });
}

class GetPostsComments {
  int postId;
  GetPostsComments({
    required this.postId,
  });
}

class GetUserTodosAction {
  int userId;
  GetUserTodosAction({
    required this.userId,
  });
}

class GetUserPostsAction {
  int userId;
  GetUserPostsAction({
    required this.userId,
  });
}

class GetUserAlbumsAction {
  int userId;
  GetUserAlbumsAction({
    required this.userId,
  });
  
}
