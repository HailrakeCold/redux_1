import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_redux_1/UI/pages/between_page_screen.dart';
import 'package:test_redux_1/mgr/redux/actions.dart';
import 'package:test_redux_1/mgr/redux/state.dart';
import 'package:test_redux_1/models/user_model.dart';

class UserScreen extends StatelessWidget {
  
   UserScreen({Key? key}) : super(key: key);
List<UserModel> userList = [];


  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      onInit: (_) async{
        await appStore.dispatch(GetUsersAction());
      },
        converter: (store) => store.state,
        builder: (context, state) {
          userList = state.userList;
          
          return Scaffold(
            appBar: AppBar(),

            backgroundColor:const Color.fromARGB(255, 194, 199, 195),
            body: Padding(
              padding:  EdgeInsets.symmetric(vertical: 44.h, horizontal: 16.w),
              child: 
              userList.isNotEmpty ?
              Column(
                
                children: [
                  Container(
                  color:const Color.fromARGB(255, 0, 0, 0),

                  child: Padding(
                   padding:  EdgeInsets.symmetric(
                     vertical: 15.h,
               horizontal: 16.w
                   ),
                   child:
                   Column(
                   mainAxisAlignment: MainAxisAlignment.start,  
                   children:const [
                       Text('Apple Co',
                       style: TextStyle(
                       color: Color.fromARGB(255, 235, 252, 3),
                       fontSize: 25,
                       fontWeight: FontWeight.w600,
                       fontFamily: "October Devanagari"),),
                       Text('Character\'s business cards',
                       style: TextStyle(
                       color: Color.fromARGB(255, 235, 252, 3),
                       fontSize: 20,
                       fontWeight: FontWeight.w400,
                       fontFamily: "October Devanagari"),),  
                     ],
                   )  
                      ),
                ),
Flexible(
  child:   ListView.builder(
    itemCount: userList.length,
  
    itemBuilder: (context , index) {
  
  return GestureDetector (

    onTap: () {
      appStore.dispatch(UpdateAction(selectedId: userList[index].id));
       Navigator.of(context).push(MaterialPageRoute(builder: (_) => BetweenPageScreen()));

    },
    child: Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h ),
      child: Container(

             decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 0, 0),
              border: Border.all(
                  color:const Color.fromARGB(255, 196, 1, 1),
                  width: 5.0.w,
                  style: BorderStyle.solid
              ),),
      
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
               children: [ 
                 Text('Person\'s index: '+userList[index].id.toString(),
                 style:const TextStyle(
                       color: Color.fromARGB(255, 226, 250, 6),
                       fontSize: 14,
                       fontWeight: FontWeight.w500,
                       fontFamily: "October Devanagari"),),
                 Text('Character\'s name: '+userList[index].name,
                 style:const TextStyle(
                       color: Color.fromARGB(255, 226, 250, 6),
                       fontSize: 14,
                       fontWeight: FontWeight.w500,
                       fontFamily: "October Devanagari"),),
                 Text('Character\'s nickname: '+userList[index].username,
                 style:const TextStyle(
                       color: Color.fromARGB(255, 226, 250, 6),
                       fontSize: 14,
                       fontWeight: FontWeight.w500,
                       fontFamily: "October Devanagari"),),
                 Text('Character\'s email: '+userList[index].email,
                 style:const TextStyle(
                      color: Color.fromARGB(255, 226, 250, 6),
                       fontSize: 14,
                       fontWeight: FontWeight.w500,
                       fontFamily: "October Devanagari"),),
                 Text('Character\'s phone: '+userList[index].phone,
                 style:const TextStyle(
                      color: Color.fromARGB(255, 226, 250, 6),
                       fontSize: 14,
                       fontWeight: FontWeight.w500,
                       fontFamily: "October Devanagari"),)
               ]
              ),
            ),
      
      height: 150.h,
      
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

