import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_insta/screens/reels/controller/reel_controller.dart';
import 'package:flutter_insta/screens/reels/widgets/video_view.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({
    super.key,
  });

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  final reelController = Get.isRegistered<ReelController>()
      ? Get.find<ReelController>()
      : Get.put(ReelController());
  int currentIndex = 0;
  bool showCompleteDesc = false;
  List<String> videoList = [
    "https://firebasestorage.googleapis.com/v0/b/medapp-8793f.appspot.com/o/SaveInsta.App%20-%203167133520015064957.mp4?alt=media&token=c4abfb57-6a13-4636-9991-71e9cc9a1b7e&_gl=1*8f251d*_ga*NjMzNTYwODcyLjE2ODg0ODQ4NjQ.*_ga_CW55HF8NVT*MTY5ODM5Mzc5Mi4yNC4xLjE2OTgzOTU2NjYuMjUuMC4w",
    "https://player.vimeo.com/external/552421426.hd.mp4?s=a4e3b5d1768bd29f37298743162e1b15c93856e4&profile_id=172&oauth2_token_id=57447761",
    "https://firebasestorage.googleapis.com/v0/b/medapp-8793f.appspot.com/o/SaveInsta.App%20-%203206988228012104402.mp4?alt=media&token=81a715ab-1bd1-415d-a24d-c132915801e2&_gl=1*zr4xi7*_ga*NjMzNTYwODcyLjE2ODg0ODQ4NjQ.*_ga_CW55HF8NVT*MTY5ODM5Mzc5Mi4yNC4xLjE2OTgzOTU2OTAuMS4wLjA.",
    "https://firebasestorage.googleapis.com/v0/b/medapp-8793f.appspot.com/o/SaveInsta.App%20-%203155551423668174495.mp4?alt=media&token=4ae7b9cb-0258-4b56-9b7e-33741666e8c2&_gl=1*1rnkuyg*_ga*NjMzNTYwODcyLjE2ODg0ODQ4NjQ.*_ga_CW55HF8NVT*MTY5ODM5Mzc5Mi4yNC4xLjE2OTgzOTU3NTMuNjAuMC4w",
    "https://firebasestorage.googleapis.com/v0/b/medapp-8793f.appspot.com/o/SaveInsta.App%20-%203222422048936417241.mp4?alt=media&token=7c6a2ea8-9ba8-409c-b254-ed3893fbfaff&_gl=1*pt9exp*_ga*NjMzNTYwODcyLjE2ODg0ODQ4NjQ.*_ga_CW55HF8NVT*MTY5ODM5Mzc5Mi4yNC4xLjE2OTgzOTM4NzYuNTEuMC4w"
  ];

  List<FileInfo?> cachedFilesData = [];

  List<File> imageFiles = [];

  List<Map<String, dynamic>> videoData = [];

  bool isStartedPlaying = false;

  @override
  void initState() {
    initializePlayer(0);
    super.initState();
  }

  Future<void> initializePlayer(index) async {
    if (reelController.videoUrl.value != '') {
      setState(() {
        if (videoList.contains(reelController.videoUrl.value)) {
          videoList.remove(reelController.videoUrl.value);
        }
        videoList = [reelController.videoUrl.value, ...videoList];
      });
    }
    await processVideoData();
    setState(() {
      videoData[0]['controller']!.play();
    });
  }

  @override
  void dispose() {
    if (videoData.isNotEmpty) {
      for (var v in videoData) {
        v['controller']!.dispose();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.black,
      width: double.infinity,
      height: MediaQuery.of(context).size.height - 98.5,
      child: VideoView(
        callBack: (int pageNumb) {
          videoData[currentIndex]['controller']!.pause();
          videoData[pageNumb]['controller']!.play();

          setState(() {
            currentIndex = pageNumb;
          });
        },
        interactionCallBack: () {
          setState(() {
            if (showCompleteDesc) {
              showCompleteDesc = false;
            } else {
              showCompleteDesc = true;
            }
          });
        },
        showCompleteDesc: showCompleteDesc,
        currentIndex: currentIndex,
        videoData: videoData,
      ),
    ));
  }

  Future<List<Map<String, dynamic>>> getVideoData() async {
    List<Map<String, dynamic>> vData = [];
    final cData = await checkCacheForAll();

    for (var videoUrl in videoList) {
      final v = cData.indexWhere((d) => d!.originalUrl == videoUrl);

      if (v != -1) {
        vData.add({
          'url': videoUrl,
          'file': cData[v]!.file,
          'isCached': true,
          'profileImg':
              'https://instagram.fpnq13-2.fna.fbcdn.net/v/t51.2885-19/279076380_406902630898235_2083113449618352146_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fpnq13-2.fna.fbcdn.net&_nc_cat=111&_nc_ohc=gq-Anvb7xnsAX_cHFfK&edm=ACWDqb8BAAAA&ccb=7-5&oh=00_AfAaox_DZ78guTPlk1R4OmI-EfvSNdC9EklwO1H7ApLf-g&oe=65416ED5&_nc_sid=ee9879',
          'username': 'pravinnatsu',
          'desc':
              'Lorem ipsum dolor sit amet. Hic odio voluptatem qui nulla quas vel inventore quibusdam eum neque adipisci et labore quas ea aperiam officiis eos enim tempora. Aut quas saepe et sapiente fugit quo internos quibusdam et nostrum',
          'tags': ['fairytail', 'natsu', 'srk', 'mvoies', 'srk', 'mvoies']
        });
      } else {
        vData.add({
          'url': videoUrl,
          'file': null,
          'isCached': false,
          'profileImg':
              'https://instagram.fpnq13-2.fna.fbcdn.net/v/t51.2885-19/279076380_406902630898235_2083113449618352146_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fpnq13-2.fna.fbcdn.net&_nc_cat=111&_nc_ohc=gq-Anvb7xnsAX_cHFfK&edm=ACWDqb8BAAAA&ccb=7-5&oh=00_AfAaox_DZ78guTPlk1R4OmI-EfvSNdC9EklwO1H7ApLf-g&oe=65416ED5&_nc_sid=ee9879',
          'username': 'pravinnatsu',
          'desc':
              'Lorem ipsum dolor sit amet. Hic odio voluptatem qui nulla quas vel inventore quibusdam eum neque adipisci et labore quas ea aperiam officiis eos enim tempora. Aut quas saepe et sapiente fugit quo internos quibusdam et nostrum',
          'tags': ['fairytail', 'natsu', 'srk', 'mvoies', 'fairytail', 'mvoies']
        });
      }
    }

    return vData;
  }

  Future<void> processVideoData() async {
    final vdata = await getVideoData();

    setState(() {
      videoData = vdata;
    });

    for (var i = 0; i < videoData.length; i++) {
      if (videoData[i]['isCached'] == true) {
        videoData[i]['controller'] =
            VideoPlayerController.file(videoData[i]['file']);

        videoData[i]['controller']!.initialize().then((value) {});
      } else {
        videoData[i]['controller'] =
            VideoPlayerController.networkUrl(Uri.parse(videoData[i]['url']));
        videoData[i]['controller']!.initialize().then((value) {
          // print("I am here 3...........");
          cachedForUrl(videoData[i]['url']);
        });
      }
    }
  }

  Future<FileInfo?> checkCacheFor(String url) async {
    final FileInfo? value = await DefaultCacheManager().getFileFromCache(url);
    return value;
  }

  Future<List<FileInfo?>> checkCacheForAll() async {
    final List<FileInfo?> infoList = [];
    for (var videoUrl in videoList) {
      final data = await DefaultCacheManager().getFileFromCache(videoUrl);
      if (data != null) {
        infoList.add(data);
      }
    }
    return infoList;
  }

  void cachedForUrl(String url) async {
    await DefaultCacheManager().getSingleFile(url);
  }
}
