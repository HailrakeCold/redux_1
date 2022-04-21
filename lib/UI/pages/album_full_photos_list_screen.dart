import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_redux_1/mgr/redux/state.dart';

class AlbumFullPhotosListScreen extends StatelessWidget {
  const AlbumFullPhotosListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(

        converter: (store) => store.state,
        builder: (context, state) {
          return Scaffold(
            
         appBar: AppBar(title:const Text('Album ID'),),
            backgroundColor:const Color.fromARGB(255, 194, 199, 195),
       
            body: SizedBox(
              width: 500.w,
              height: 500.h,
             child: Image.network(state.albumPhotos[state.selectedPhoto].url),
            ),
     );

        },
    );
  }
}