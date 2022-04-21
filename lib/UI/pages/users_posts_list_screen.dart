import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_redux_1/UI/pages/post_comment_list_screen.dart';
import 'package:test_redux_1/mgr/redux/actions.dart';
import 'package:test_redux_1/mgr/redux/state.dart';
import 'package:test_redux_1/models/user_posts_model.dart';



class UsersPostsListScreen extends StatelessWidget {
   UsersPostsListScreen({Key? key}) : super(key: key);
List<UserPostModel> usersPostList = [];

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(

        converter: (store) => store.state,
        builder: (context, state) {
          usersPostList = state.userPostList;
          return Scaffold(
          appBar: AppBar(title:Text('User ID: ${state.selectedId}'),),

            backgroundColor:const Color.fromARGB(255, 194, 199, 195),
            body: Padding(
              padding:  EdgeInsets.symmetric(vertical: 44.h, horizontal: 16.w),
              child: 
              usersPostList.isNotEmpty ?
              Column(
             mainAxisAlignment: MainAxisAlignment.start, 
                children: [
                 
Flexible(
  child:   ListView.builder(
    itemCount: usersPostList.length,
  
    itemBuilder: (context , index) {
  
  return GestureDetector(
onTap: () {
       appStore.dispatch(GetPostsComments(postId: state.userPostList[index].id));
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => PostCommentListScreen()));

    },

    child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 10.h ),
        child: Container(
               decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0),
                border: Border.all(
                    color: const Color.fromARGB(255, 196, 1, 1),
                    width: 5.0.w,
                    style: BorderStyle.solid
                ),),
        
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                 children: [ 
                   
                   Text('Post\'s id: '+usersPostList[index].id.toString(),
                   style:const TextStyle(
                         color: Color.fromARGB(255, 226, 250, 6),
                         fontSize: 14,
                         fontWeight: FontWeight.w500,
                         fontFamily: "October Devanagari"),),
                         
                   Text('Post\'s title: '+usersPostList[index].title,
                   style:const TextStyle(
                         color: Color.fromARGB(255, 226, 250, 6),
                         fontSize: 14,
                         fontWeight: FontWeight.w500,
                         fontFamily: "October Devanagari"),),
                   
                    Text('Post\'s body : '+usersPostList[index].body,
                   style:const TextStyle(
                         color: Color.fromARGB(255, 226, 250, 6),
                         fontSize: 14,
                         fontWeight: FontWeight.w500,
                         fontFamily: "October Devanagari"),),
                 ]
                ),
              ),
        
        
        width: 390.w,
  
        ),
    ),
  );
  },
  ),
)

] 

) : 
const Center(child: CircularProgressIndicator()),
            ),
     );
        },
    );
  }
}