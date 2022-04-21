import 'dart:convert';
import 'package:redux/redux.dart';
import 'package:test_redux_1/mgr/redux/actions.dart';
import 'package:test_redux_1/mgr/redux/state.dart';
import 'package:http/http.dart' as http;
import 'package:test_redux_1/models/album_model.dart';
import 'package:test_redux_1/models/user_comment_model.dart';
import 'package:test_redux_1/models/user_model.dart';
import 'package:test_redux_1/models/album_photos_model.dart';
import 'package:test_redux_1/models/user_posts_model.dart';
import 'package:test_redux_1/models/user_todos_model.dart';
import 'package:test_redux_1/utils/constant.dart';

class AppMiddleware extends MiddlewareClass<AppState> {
  @override
  call(Store<AppState> store, action, NextDispatcher next) {
    switch (action.runtimeType) {
      case GetUsersAction:
        return _getUsersAction(store.state, next);
      case GetUserAlbumsAction:
        return _getUserAlbumAction(store.state, next, action);
      case GetUserPostsAction:
        return _getUserPostsAction(store.state, next, action);
      case GetUserTodosAction:
        return _getUserTodosAction(store.state, next, action);
      case GetAlbumPhotosAction:
        return _getAlbumPhotoAction(store.state, next, action);
      case GetPostsComments:
        return _getPostsComments(store.state, next, action);
      default:
        next(action);
    }
  }

  _getUsersAction(AppState state, NextDispatcher next) async {
    var url = Uri.https(
      Constants.apiUrl,
      Constants.user,
    );
    List<UserModel> userModelList = [];
    var response =
        await http.get(url, headers: {'Content-type': "application/json"});
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);
      List list = decoded;
      for (int index = 0; index < list.length; index++) {
        userModelList.add(UserModel.fromJson(list[index]));
      }
      next(UpdateAction(userLIst: userModelList));
    }
  }

  _getUserAlbumAction(
      AppState state, NextDispatcher next, GetUserAlbumsAction action) async {
    var url = Uri.https(
      Constants.apiUrl,
      Constants.user + "/${action.userId}" + Constants.albums,
    );
    List<AlbumModel> albumModelList = [];
    var response =
        await http.get(url, headers: {'Content-type': "application/json"});
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);
      List albumList = decoded;
      for (int index = 0; index < albumList.length; index++) {
        albumModelList.add(AlbumModel.fromJson(albumList[index]));
      }
      next(UpdateAction(userAlbumList: albumModelList));
    }
  }
}

_getPostsComments(
    AppState state, NextDispatcher next, GetPostsComments action) async {
  action.postId;
  var url = Uri.https(
    Constants.apiUrl,
    Constants.posts + "/${action.postId}" + Constants.comments,
  );
  List<PostCommentModel> postCommentList = [];
  var response =
      await http.get(url, headers: {'Content-type': "application/json"});
  if (response.statusCode == 200) {
    var decoded = json.decode(response.body);
    List commentsList = decoded;
    for (int index = 0; index < commentsList.length; index++) {
      postCommentList.add(PostCommentModel.fromJson(commentsList[index]));
    }
    next(UpdateAction(getPostsComments: postCommentList));
  }
}

_getAlbumPhotoAction(
    AppState state, NextDispatcher next, GetAlbumPhotosAction action) async {
  action.albumId;
  var url = Uri.https(
    Constants.apiUrl,
    Constants.albums + "/${action.albumId}" + Constants.photos,
  );
  List<AlbumPhotosModel> albumPhotoList = [];
  var response =
      await http.get(url, headers: {'Content-type': "application/json"});
  if (response.statusCode == 200) {
    var decoded = json.decode(response.body);
    List photoList = decoded;
    for (int index = 0; index < photoList.length; index++) {
      albumPhotoList.add(AlbumPhotosModel.fromJson(photoList[index]));
    }
    next(UpdateAction(albumPhotosList: albumPhotoList));
  }
}

_getUserPostsAction(
    AppState state, NextDispatcher next, GetUserPostsAction action) async {
  action.userId;
  var url = Uri.https(
    Constants.apiUrl,
    Constants.user + "/${action.userId}" + Constants.posts,
  );
  List<UserPostModel> postModelList = [];
  var response =
      await http.get(url, headers: {'Content-type': "application/json"});
  if (response.statusCode == 200) {
    var decoded = json.decode(response.body);
    List postList = decoded;
    for (int index = 0; index < postList.length; index++) {
      postModelList.add(UserPostModel.fromJson(postList[index]));
    }
    next(UpdateAction(userPostList: postModelList));
  }
}

_getUserTodosAction(
    AppState state, NextDispatcher next, GetUserTodosAction action) async {
  var url = Uri.https(
    Constants.apiUrl,
    Constants.user + "/${action.userId}" + Constants.todos,
  );
  List<UserTodosModel> userTodosList = [];
  var response =
      await http.get(url, headers: {'Content-type': "application/json"});
  if (response.statusCode == 200) {
    var decoded = json.decode(response.body);
    List todosList = decoded;
    for (int index = 0; index < todosList.length; index++) {
      userTodosList.add(UserTodosModel.fromJson(todosList[index]));
    }
    next(UpdateAction(userTodos: userTodosList));
  }
}
