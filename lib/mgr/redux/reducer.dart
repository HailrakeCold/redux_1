import 'package:test_redux_1/mgr/redux/state.dart';

AppState appReducer(AppState state, dynamic action) {
  AppState newState = state.copyWith(
    userList: action.userLIst ?? state.userList,
    userAlbumList: action.userAlbumList ?? state.userAlbumList,
    userPostList: action.userPostList ?? state.userPostList,
    userTodos: action.userTodos ?? state.userTodos,
    albumPhotos:action.albumPhotosList ?? state.albumPhotos,
    getPostsComments: action.getPostsComments ?? state.getPostsComments,
    selectedId: action.selectedId ?? state.selectedId,
    selectedPhoto: action.selectedPhoto ?? state.selectedPhoto,
  );

  return newState;
}
