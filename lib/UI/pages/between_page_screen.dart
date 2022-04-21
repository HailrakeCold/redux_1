import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_redux_1/UI/pages/user_albums_lists_screen.dart';
import 'package:test_redux_1/UI/pages/user_todos_list_screen.dart';
import 'package:test_redux_1/UI/pages/users_posts_list_screen.dart';
import 'package:test_redux_1/mgr/redux/actions.dart';
import 'package:test_redux_1/mgr/redux/state.dart';



class BetweenPageScreen extends StatelessWidget {
   BetweenPageScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Scaffold(
      appBar: AppBar(title:const Text('Buttons page'),),
      body: Center(
        child: Column(
          children: [
          SizedBox( height: 200.h,),
        TextButton(style: TextButton.styleFrom(primary:const Color.fromARGB(255, 6, 241, 14),),
        onPressed: () async {
          await appStore.dispatch(GetUserAlbumsAction(userId: state.selectedId));
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => UserAlbumsListScreen()));

        },
        child:const Text('User album page'),
      ), 

      SizedBox( height: 100.h,),

      TextButton(style: TextButton.styleFrom(primary:const Color.fromARGB(255, 77, 2, 252)),
        onPressed: () async {
          await appStore.dispatch(GetUserPostsAction(userId: state.selectedId));
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => UsersPostsListScreen()));
        },
        child:const Text('User posts page'),
      ),

      SizedBox( height: 100.h,),

      TextButton(style: TextButton.styleFrom(primary:const Color.fromARGB(255, 253, 0, 253)),
        onPressed: () async {
          await appStore.dispatch(GetUserTodosAction(userId: state.selectedId));
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => UserTodosListScreen()));
        },
        child:const Text('User todos page'),
      ),

          ],
          
        ),
      ),
    );
        },
    );
  }
}













