// import 'package:flutter/material.dart';
// import 'package:web_video_3/pages/home.dart';


import 'package:flutter/material.dart';
import 'package:web_video_3/pages/home.dart';
import 'package:get/get.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

   final videosCall videoApi = Get.put(videosCall());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onInit: (){
  
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home:MyHomePage(),
    );
  }
}




