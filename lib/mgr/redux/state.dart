import 'package:redux/redux.dart';
import 'package:test_redux_1/mgr/redux/middleware.dart';
import 'package:test_redux_1/mgr/redux/reducer.dart';
import 'package:test_redux_1/models/album_model.dart';
import 'package:test_redux_1/models/user_comment_model.dart';
import 'package:test_redux_1/models/user_model.dart';
import 'package:test_redux_1/models/album_photos_model.dart';
import 'package:test_redux_1/models/user_posts_model.dart';
import 'package:test_redux_1/models/user_todos_model.dart';

final appStore = Store<AppState>(
  appReducer,
  initialState: AppState.initial(),
  middleware: [AppMiddleware()],
);

class AppState {
  final List<UserModel> userList;
  final List<AlbumModel> userAlbumList;
  final List<UserPostModel> userPostList;
  final List<UserTodosModel> userTodos;
  final List<AlbumPhotosModel> albumPhotos;
  final List<PostCommentModel> getPostsComments;
  final int selectedId;
  final int selectedPhoto;
  AppState({
    required this.getPostsComments,
    required this.albumPhotos,
    required this.userList,
    required this.userAlbumList,
    required this.userPostList,
    required this.userTodos,
    required this.selectedId,
    required this.selectedPhoto,
  });

  factory AppState.initial() {
    return AppState(
      selectedPhoto: -1,
      selectedId: -1,
      getPostsComments: [],
      albumPhotos: [],
      userTodos: [],
      userPostList: [],
      userAlbumList: [],
      userList: [],
    );
  }

  AppState copyWith({
    List<UserModel>? userList,
    List<AlbumModel>? userAlbumList,
    List<UserPostModel>? userPostList,
    List<UserTodosModel>? userTodos,
    List<AlbumPhotosModel>? albumPhotos,
    List<PostCommentModel>? getPostsComments,
    int? selectedId,
    int? selectedPhoto,
  }) {
    return AppState(
      selectedPhoto: selectedPhoto ?? this.selectedPhoto,
      selectedId: selectedId ?? this.selectedId,
      userAlbumList: userAlbumList ?? this.userAlbumList,
      userList: userList ?? this.userList,
      userPostList: userPostList ?? this.userPostList,
      userTodos: userTodos ?? this.userTodos,
      albumPhotos:albumPhotos ?? this.albumPhotos,
      getPostsComments: getPostsComments ?? this.getPostsComments,
    );
  }
}
