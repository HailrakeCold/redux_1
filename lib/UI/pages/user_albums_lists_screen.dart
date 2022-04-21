import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_redux_1/UI/pages/album_photos_list_screen.dart';
import 'package:test_redux_1/mgr/redux/actions.dart';
import 'package:test_redux_1/mgr/redux/state.dart';
import 'package:test_redux_1/models/album_model.dart';



class UserAlbumsListScreen extends StatelessWidget {
   UserAlbumsListScreen({Key? key}) : super(key: key);
List<AlbumModel> userAlbumList = [];

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      
      
        converter: (store) => store.state,
        builder: (context, state) {
          userAlbumList = state.userAlbumList;
          return Scaffold(
           appBar: AppBar(title:Text('User ID: ${state.selectedId}'),),

            backgroundColor:const Color.fromARGB(255, 194, 199, 195),
            body: Padding(
              padding:  EdgeInsets.symmetric(vertical: 44.h, horizontal: 16.w),
              child: 
              userAlbumList.isNotEmpty ?
              Column(
                
                children: [
                  
Flexible(
  child:   ListView.builder(
    itemCount: userAlbumList.length,
  
    itemBuilder: (context , index) {
  
  return GestureDetector(
onTap: () {
      appStore.dispatch(GetAlbumPhotosAction(albumId:userAlbumList[index].id ));
       Navigator.of(context).push(MaterialPageRoute(builder: (_) => AlbumPhotosListScreen()));

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
                 children: [ 
                   Text('Album\'s id: '+userAlbumList[index].id.toString(),
                   style:const TextStyle(
                         color: Color.fromARGB(255, 226, 250, 6),
                         fontSize: 14,
                         fontWeight: FontWeight.w500,
                         fontFamily: "October Devanagari"),),
                   Text('Album\'s title: '+userAlbumList[index].title,
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