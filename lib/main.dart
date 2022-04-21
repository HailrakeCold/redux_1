import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_redux_1/UI/pages/users_screen.dart';
import 'package:test_redux_1/mgr/redux/state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: appStore,
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: () {
          return  MaterialApp(
   
            debugShowCheckedModeBanner: false,
            title: 'TEST ',
          home: UserScreen(),
    );
        },),);
  }
  }
  

