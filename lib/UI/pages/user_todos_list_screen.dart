import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_redux_1/mgr/redux/state.dart';
import 'package:test_redux_1/models/user_todos_model.dart';



class UserTodosListScreen extends StatelessWidget {
   UserTodosListScreen({Key? key}) : super(key: key);
List<UserTodosModel> userTodosList = [];

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(

        converter: (store) => store.state,
        builder: (context, state) {
          userTodosList = state.userTodos;
          return Scaffold(
         appBar: AppBar(title:Text('User ID: ${state.selectedId}'),),


            backgroundColor:const Color.fromARGB(255, 194, 199, 195),
            body: Padding(
              padding:  EdgeInsets.symmetric(vertical: 44.h, horizontal: 16.w),
              child: 
              userTodosList.isNotEmpty ?
              Column(
              mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 
Flexible(
  child:   ListView.builder(
    itemCount: userTodosList.length,
  
    itemBuilder: (context , index) {
  
  return Padding(
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
                       Text('UserId : '+userTodosList[index].userId.toString(),
                 style:const TextStyle(
                       color: Color.fromARGB(255, 226, 250, 6),
                       fontSize: 14,
                       fontWeight: FontWeight.w500,
                       fontFamily: "October Devanagari"),),
                 Text('Todos\'s title: '+userTodosList[index].title,
                 style:const TextStyle(
                       color: Color.fromARGB(255, 226, 250, 6),
                       fontSize: 14,
                       fontWeight: FontWeight.w500,
                       fontFamily: "October Devanagari"),),
                 
                  Text('Completed\'s todos : '+userTodosList[index].completed.toString(),
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