import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_redux_1/UI/pages/album_full_photos_list_screen.dart';
import 'package:test_redux_1/mgr/redux/actions.dart';
import 'package:test_redux_1/mgr/redux/state.dart';
import '../../models/album_photos_model.dart';



class AlbumPhotosListScreen extends StatelessWidget {
   AlbumPhotosListScreen({Key? key}) : super(key: key);
List<AlbumPhotosModel> albumPhotosList = [];

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(

        converter: (store) => store.state,
        builder: (context, state) {
          albumPhotosList = state.albumPhotos;
          return Scaffold(
         appBar: AppBar(title:const Text('Album ID'),),


            backgroundColor:const Color.fromARGB(255, 194, 199, 195),
            body: Padding(
              padding:  EdgeInsets.symmetric(vertical: 44.h, horizontal: 16.w),
              child: 
              albumPhotosList.isNotEmpty ?
              Column(
              mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 
Flexible(
  child:   ListView.builder(
    itemCount: albumPhotosList.length,
  
    itemBuilder: (context , index) {
  
  return GestureDetector(
onTap: () {
    appStore.dispatch(UpdateAction(selectedPhoto:albumPhotosList[index].albumId ));
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => AlbumFullPhotosListScreen()));
    },
    child:Padding(
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
              child: Row(
                children: [ 
                  SizedBox(
                    height: 50.h,
                    width: 50.w,
                    child:
                   Image.network(albumPhotosList[index].thumbnailUrl),
                  ),
                  SizedBox( width: 10.w,),
                  Expanded(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [ 
                    Text('UserId : '+albumPhotosList[index].id.toString(),
                     style:const TextStyle(
                           color: Color.fromARGB(255, 226, 250, 6),
                           fontSize: 14,
                           fontWeight: FontWeight.w500,
                           fontFamily: "October Devanagari"),),
                     Text('Album ID: '+albumPhotosList[index].albumId.toString(),
                     style:const TextStyle(
                           color: Color.fromARGB(255, 226, 250, 6),
                           fontSize: 14,
                           fontWeight: FontWeight.w500,
                           fontFamily: "October Devanagari"),),
                     
                      Text('Photo\'s title : '+albumPhotosList[index].title,
                     style:const TextStyle(
                           color: Color.fromARGB(255, 226, 250, 6),
                           fontSize: 14,
                           fontWeight: FontWeight.w500,
                           fontFamily: "October Devanagari"),),
                                   
                                
                                   ]
                                  ),
                  ),
                
                ]
              ),
            ),
      
      width: 450.w,

      ),
  ),);
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