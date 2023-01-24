import 'dart:async';

import 'dart:typed_data';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:card_swiper/card_swiper.dart';
// import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:web_video_3/pages/video_player.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:pdfx/pdfx.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:page_transition/page_transition.dart';
import '../globaldata/global_data.dart';

var imageCount;
// var longVideo = 'https://devshamseer.github.io/videoSongApi/videosong1.mp4';
var curetvideo='https://devshamseer.github.io/videoSongApi/videosong1.mp4';
  

class MyHomePage extends StatefulWidget {
  MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  late VideoPlayerController _videoPlayerController;

  late CustomVideoPlayerController _customVideoPlayerController;
  late CustomVideoPlayerWebController _customVideoPlayerWebController;

  CustomVideoPlayerSettings _customVideoPlayerSettings =
      CustomVideoPlayerSettings();

  CustomVideoPlayerWebSettings _customVideoPlayerWebSettings =
      CustomVideoPlayerWebSettings(
    autoplay: true,
    backgroundColor: '#000000',
    src: curetvideo,
  );

  @override
  void initState(){

  
   
  genarateThub();
    _videoPlayerController = VideoPlayerController.network(
      curetvideo,
    )..initialize().then((value) => setState(() {}));

    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
      customVideoPlayerSettings: _customVideoPlayerSettings,
      additionalVideoSources: {
        "720p": _videoPlayerController,
      },
    );

    _customVideoPlayerWebController = CustomVideoPlayerWebController(
      webVideoPlayerSettings: _customVideoPlayerWebSettings,
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var widthing = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF1f1d2c),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 21, left: 12, right: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child:
                            Icon(Icons.polymer, size: 26, color: Colors.white),
                      ),
                      Text(
                        'Mokz play'.toUpperCase(),
                        style: GoogleFonts.play(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.videocam,
                        color: Colors.white,
                        size: 31,
                      ),
                      Text(
                        thumbnails.length.toString(),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 21,
            ),
            kIsWeb
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        child: CustomVideoPlayerWeb(
                          customVideoPlayerWebController:
                              _customVideoPlayerWebController,
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      child: CustomVideoPlayer(
                        customVideoPlayerController:
                            _customVideoPlayerController,
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 18, bottom: 15),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Vidoes',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: thumbnails.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: MyHomePage()),
                          (Route<dynamic> route) => false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 160,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 11, 11, 11),
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset: const Offset(5, 5),
                            ),
                            const BoxShadow(
                                color: Color.fromARGB(255, 22, 21, 21),
                                offset: Offset(-5, -5),
                                blurRadius: 15,
                                spreadRadius: 1),
                          ],
                          color: Color(0xFF252837),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: EdgeInsets.only(left: 15),
                                height: 130,
                                width: 195,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  image: DecorationImage(
                                      image: FileImage(
                                        File(thumbnails[index]),
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                child: Center(
                                  child: Container(
                                    height: 51,
                                    width: 51,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(170, 0, 0, 0),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 15,
                              right: 12,
                              child: Container(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 59, 58, 58),
                                              spreadRadius: 1,
                                              blurRadius: 15,
                                              offset: const Offset(3, 3),
                                            ),
                                            const BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 17, 17, 17),
                                                offset: Offset(-2, -2),
                                                blurRadius: 15,
                                                spreadRadius: 1),
                                          ],
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 15),
                                                child: Text(
                                                  'Download',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                )),
                                            IconButton(
                                              onPressed: (() {}),
                                              icon:
                                                  Icon(Icons.download_rounded),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                margin: EdgeInsets.only(right: 25, top: 21),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '12-11-2022',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      '12:30AM',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

   genarateThub() async {
    var seen = Set<String>();
    for (var i = 0; i < 35; i++) {
 
      var vidoes =
          'https://devshamseer.github.io/youtubeApi/shorts/video${i}.mp4';
      videiList.add(vidoes);
      curetvideo = await videiList.first.toString();

      final fileName = await VideoThumbnail.thumbnailFile(
        video: "https://devshamseer.github.io/youtubeApi/shorts/video${i}.mp4",
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.JPEG,
        quality: 100,
      );

  
     setState(() {
          thumbnails.add(fileName);
     });
     
    }

    thumbnails = thumbnails.where((country) => seen.add(country)).toList();
    videiList = videiList.where((country) => seen.add(country)).toList();
  }

 
}

class videosCall extends GetxController{
   genarateThub() async {
    var seen = Set<String>();
    for (var i = 0; i < 35; i++) {
      update();
      var vidoes =
          'https://devshamseer.github.io/youtubeApi/shorts/video${i}.mp4';
      videiList.add(vidoes);
      curetvideo = await videiList.first.toString();

      final fileName = await VideoThumbnail.thumbnailFile(
        video: "https://devshamseer.github.io/youtubeApi/shorts/video${i}.mp4",
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.JPEG,
        quality: 100,
      );

  
        thumbnails.add(fileName);
     
    }
update();
    thumbnails = thumbnails.where((country) => seen.add(country)).toList();
    videiList = videiList.where((country) => seen.add(country)).toList();
  }
}