// import 'dart:io';

// import 'package:appinio_video_player/appinio_video_player.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:pip_view/pip_view.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:flutter_video_info/flutter_video_info.dart';
// import 'package:web_video_3/pages/home.dart';

// var url = 'https://devshamseer.github.io/allvideoApi/video31.mp4';

// class video_plyer extends StatefulWidget {
//   var video;

//   var image;

//   var videiList;

//   video_plyer(
//       {Key? key,
//       required this.video,
//       required this.image,
//       required this.videiList})
//       : super(key: key);

//   @override
//   State<video_plyer> createState() => _video_plyerState();
// }

// class _video_plyerState extends State<video_plyer> {
//   late VideoPlayerController _videoPlayerController,
//       _videoPlayerController2,
//       _videoPlayerController3;

//   late CustomVideoPlayerController _customVideoPlayerController;
//   late CustomVideoPlayerWebController _customVideoPlayerWebController;

//   final CustomVideoPlayerSettings _customVideoPlayerSettings =
//       const CustomVideoPlayerSettings();

//   @override
//   void initState() {
//     super.initState();
//     videoInfo();
//     print(widget.image);
//     widget.video;
//     _videoPlayerController = VideoPlayerController.network(
//       widget.video,
//     )..initialize().then((value) => setState(() {}));
//     final CustomVideoPlayerWebSettings _customVideoPlayerWebSettings =
//         CustomVideoPlayerWebSettings(
//       src: widget.video,
//     );
//     _videoPlayerController2 = VideoPlayerController.network(widget.video);
//     _videoPlayerController3 = VideoPlayerController.network(widget.video);
//     _customVideoPlayerController = CustomVideoPlayerController(
//       context: context,
//       videoPlayerController: _videoPlayerController,
//       customVideoPlayerSettings: _customVideoPlayerSettings,
//       additionalVideoSources: {
//         "240p": _videoPlayerController2,
//         "480p": _videoPlayerController3,
//         "720p": _videoPlayerController,
//       },
//     );

//     _customVideoPlayerWebController = CustomVideoPlayerWebController(
//       webVideoPlayerSettings: _customVideoPlayerWebSettings,
//     );
//   }

//   @override
//   void dispose() {
//     _customVideoPlayerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PIPView(
//         initialCorner: PIPViewCorner.bottomRight,
//         builder: ((context, isFloating) {
//           return Scaffold(
//             resizeToAvoidBottomInset: !isFloating,
//             // appBar: AppBar(
//             //   leading: IconButton(onPressed: (){

//             //   }, icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
//             //   backgroundColor: Colors.white,

//             // ),
//             body: Column(
//               children: [
//                 kIsWeb
//                     ? Expanded(
//                         child: Container(
//                           color: Colors.black,
//                           child: CustomVideoPlayerWeb(
//                             customVideoPlayerWebController:
//                                 _customVideoPlayerWebController,
//                           ),
//                         ),
//                       )
//                     : GestureDetector(
//                         onPanEnd: ((details) {
//                           PIPView.of(context)!.presentBelow(MyHomePage());
//                         }),
//                         child: Container(
//                           width: double.infinity,
//                           height: 250,
//                           child: CustomVideoPlayer(
//                             customVideoPlayerController:
//                                 _customVideoPlayerController,
//                           ),
//                         ),
//                       ),
//                 // CupertinoButton(
//                 //   child: const Text("Play Fullscreen"),
//                 //   onPressed: () {
//                 //     if (kIsWeb) {
//                 //       _customVideoPlayerWebController.setFullscreen(true);
//                 //       _customVideoPlayerWebController.play();
//                 //     } else {
//                 //       _customVideoPlayerController.setFullscreen(true);
//                 //       _customVideoPlayerController.videoPlayerController.play();
//                 //     }
//                 //   },
//                 // ),

//                 // SizedBox(
//                 //   height: 21,
//                 // ),

//                 Padding(
//                   padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '',
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 21),
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             height: 40,
//                             width: 50,
//                             decoration: BoxDecoration(
//                                 color: Color.fromARGB(255, 255, 255, 255),
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(8),
//                                 ),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     offset: Offset(2, 2),
//                                     blurRadius: 12,
//                                     color: Color.fromRGBO(0, 0, 0, 0.16),
//                                   )
//                                 ]),
//                             child: Center(
//                               child: IconButton(
//                                   onPressed: () async {
//                                     await Share.share(
//                                         'Clik Hear🖥${widget.video}',
//                                         subject: widget.video);
//                                   },
//                                   icon: Icon(Icons.share)),
//                             ),
//                           ),
//                           // SizedBox(width: 21,),
//                           //   Container(
//                           //   height: 40,
//                           //   width: 50,
//                           //   decoration: BoxDecoration(
//                           //       color: Color.fromARGB(255, 255, 255, 255),
//                           //       borderRadius: BorderRadius.all(
//                           //         Radius.circular(8),
//                           //       ),
//                           //       boxShadow: [
//                           //         BoxShadow(
//                           //           offset: Offset(2, 2),
//                           //           blurRadius: 12,
//                           //           color: Color.fromRGBO(0, 0, 0, 0.16),
//                           //         )
//                           //       ]),
//                           //   child: Center(
//                           //     child: IconButton(
//                           //         onPressed: () {
//                           //            videosDownload(url:widget.video,fileName:"video.mp4");
//                           //         },
//                           //         icon: Icon(Icons.file_download_outlined)),
//                           //   ),
//                           // ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: GridView.builder(
//                         physics: BouncingScrollPhysics(),
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3,
//                           crossAxisSpacing: 12,
//                           mainAxisSpacing: 30,
//                         ),
//                         itemCount: widget.videiList.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return GestureDetector(
//                             onTap: () {
//                               // // print(nameFile[index]);
//                               // var video = widget.video[index];
//                               // var image=widget.image[index];
//                               // var videoList=widget.videiList[index];
//                               // Navigator.push(
//                               //   context,
//                               //   MaterialPageRoute(
//                               //       builder: (context) => video_plyer(
//                               //             video: video,
//                               //             image:image, videiList: videoList,

//                               //           )),
//                               // );
//                             },
//                             child: Material(
//                               elevation: 21,
//                               color: Colors.transparent,
//                               child: ClipRRect(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(12)),
//                                   child: Container(
//                                     decoration: BoxDecoration(boxShadow: [
//                                       BoxShadow(
//                                         offset: Offset(2, 2),
//                                         blurRadius: 12,
//                                         color: Color.fromRGBO(0, 0, 0, 0.16),
//                                       )
//                                     ]),
//                                     child: Stack(
//                                       children: [
//                                         Image.network(
//                                           widget.image,
//                                           fit: BoxFit.fill,
//                                           filterQuality: FilterQuality.high,
//                                           alignment: Alignment.center,
//                                           width: double.infinity,
//                                           height: double.infinity,
//                                         ),
//                                         // Image.file(
//                                         //   File(
//                                         //     widget.image[index],
//                                         //   ),
//                                         //   fit: BoxFit.fill,
//                                         //   filterQuality: FilterQuality.high,
//                                         //   alignment: Alignment.center,
//                                         //   width: double.infinity,
//                                         //   height: double.infinity,
//                                         //   // color: Colors.grey,
//                                         // ),
//                                         Align(
//                                             alignment: Alignment.center,
//                                             child: Icon(
//                                               Icons.play_circle,
//                                               color: Colors.white,
//                                               size: 51,
//                                             )),
//                                       ],
//                                     ),
//                                   )),
//                             ),
//                           );
//                         }),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }));
//   }

//   Future<File?> videosDownload({required String fileName, required url}) async {
//     try {
//       print(url);
//       print('1');
//       var appstorage = await getApplicationDocumentsDirectory();
//       var file = File('${appstorage.path}/$fileName');
//       print('2');

// //   var response=await Dio().get(url);
// //   print(response.data);
// //   print('bahu1');
// // Options(
// //   responseType: ResponseType.bytes,
// //   followRedirects: false,
// //   receiveTimeout: 0
// // );
//       print('bahu2');
//       var raf = await file.openSync(mode: FileMode.write);
//       print('bahu3');
// //  raf.writeFrom(response.data!);
//       print('bahu4');
//       await raf.close();
//       print('bahu5');

//       print('bahu');
//       print(file.path);

// // OpenFile.open(file.path);

//       return file;
//     } catch (e) {
//       return null;
//     }
//   }

//   videoInfo() async {
//     final videoInfo = FlutterVideoInfo();

//     print('start');
//     String videoFilePath =
//         "https://devshamseer.github.io/youtubeApi/shorts/video1.mp4";
//     var info = await videoInfo.getVideoInfo(videoFilePath);
//     print('start' + info.toString());

// //String title = info.title;   to get title of video
// //similarly path,author,mimetype,height,width,filesize,duration,orientation,date,framerate,location can be extracted.
//   }
// }

// String videoUrlLandscape = url;
// String videoUrlPortrait = url;
// String longVideo = 'https://devshamseer.github.io/youtubeApi/shorts/video1.mp4';

// String video720 = url;

// String video480 = url;

// String video240 = url;
