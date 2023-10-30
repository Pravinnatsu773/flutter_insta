import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_insta/screens/main_screen/main_screen_controller.dart';
import 'package:flutter_insta/screens/reels/controller/reel_controller.dart';
import 'package:flutter_insta/utils/controllers/insta_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Explore extends StatefulWidget {
  Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final reelController = Get.isRegistered<ReelController>()
      ? Get.find<ReelController>()
      : Get.put(ReelController());

  final mainScreenController = Get.isRegistered<MainScreenController>()
      ? Get.find<MainScreenController>()
      : Get.put(MainScreenController());
  final instaController = Get.isRegistered<InstaController>()
      ? Get.find<InstaController>()
      : Get.put(InstaController());
  List<int> reelsIndexes = [];
  List<int> visibleIndex = [];
  List<int> nonVisibleIndex = [];

  List<Map<String, dynamic>> feedList = [
    {
      'type': 'image',
      'url':
          "https://cdn.marvel.com/content/1x/antmanandthewaspquantumania_lob_crd_03.jpg",
      'isCached': false,
      'file': null
    },
    {
      'type': 'image',
      'url':
          "https://www.top10about.com/wp-content/uploads/2018/01/Tom-Cruise.jpg",
      'isCached': false,
      'file': null
    },
    {
      'type': 'reel',
      'url':
          "https://firebasestorage.googleapis.com/v0/b/medapp-8793f.appspot.com/o/SaveInsta.App%20-%203206988228012104402.mp4?alt=media&token=81a715ab-1bd1-415d-a24d-c132915801e2&_gl=1*zr4xi7*_ga*NjMzNTYwODcyLjE2ODg0ODQ4NjQ.*_ga_CW55HF8NVT*MTY5ODM5Mzc5Mi4yNC4xLjE2OTgzOTU2OTAuMS4wLjA.",
      'isCached': false,
      'file': null,
      'controller': null
    },
    {
      'type': 'image',
      'url':
          "https://i.pinimg.com/736x/f2/62/37/f26237aa2950b1b1ff1ddaacd65daf57.jpg",
      'isCached': false,
      'file': null
    },
    {
      'type': 'image',
      'url':
          "https://i.pinimg.com/736x/b7/da/1e/b7da1ec6b90c9b8eeeb0f4278a74e684.jpg",
      'isCached': false,
      'file': null
    },
    {
      'type': 'reel',
      'url':
          "https://firebasestorage.googleapis.com/v0/b/medapp-8793f.appspot.com/o/SaveInsta.App%20-%203222422048936417241.mp4?alt=media&token=7c6a2ea8-9ba8-409c-b254-ed3893fbfaff&_gl=1*pt9exp*_ga*NjMzNTYwODcyLjE2ODg0ODQ4NjQ.*_ga_CW55HF8NVT*MTY5ODM5Mzc5Mi4yNC4xLjE2OTgzOTM4NzYuNTEuMC4w",
      'isCached': false,
      'file': null,
      'controller': null
    },
    {
      'type': 'image',
      'url':
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcxMSmuPwvdyx8rUn5DNJPU1GWLDVotL6DbQ&usqp=CAU",
      'isCached': false,
      'file': null
    },
    {
      'type': 'image',
      'url':
          "https://i.pinimg.com/736x/d1/a1/ab/d1a1ab02d2d0ada17b994c9e3174e8a8.jpg",
      'isCached': false,
      'file': null
    },
    {
      'type': 'image',
      'url':
          "https://pm1.aminoapps.com/7117/d4cbf4ff68f8f7ff3425da8b432da8bbb1a3fa76r1-640-640v2_uhq.jpg",
      'isCached': false,
      'file': null
    },
    {
      'type': 'image',
      'url': "https://cdn.wallpapersafari.com/53/68/cuqJZR.jpg",
      'isCached': false,
      'file': null
    },
    {
      'type': 'image',
      'url': "https://i.imgflip.com/7tftqm.jpg",
      'isCached': false,
      'file': null
    },
    {
      'type': 'image',
      'url':
          "https://imgk.timesnownews.com/story/Won.png?tr=w-400,h-300,fo-auto",
      'isCached': false,
      'file': null
    },
    {
      'type': 'reel',
      'url':
          "https://firebasestorage.googleapis.com/v0/b/medapp-8793f.appspot.com/o/SaveInsta.App%20-%203167133520015064957.mp4?alt=media&token=c4abfb57-6a13-4636-9991-71e9cc9a1b7e&_gl=1*8f251d*_ga*NjMzNTYwODcyLjE2ODg0ODQ4NjQ.*_ga_CW55HF8NVT*MTY5ODM5Mzc5Mi4yNC4xLjE2OTgzOTU2NjYuMjUuMC4w",
      'isCached': false,
      'file': null,
      'controller': null
    },
    {
      'type': 'image',
      'url':
          "https://loginextsolutions.com/blog/wp-content/uploads/2022/08/2.jpg",
      'isCached': false,
      'file': null
    },
    {
      'type': 'image',
      'url':
          "https://awkward.com/wp-content/uploads/2017/10/utterly-random-memes-thatll-make-you-spit-out-your-morning-coffee-october-9-2017-22.jpg",
      'isCached': false,
      'file': null
    },
    {
      'type': 'reel',
      'url':
          "https://firebasestorage.googleapis.com/v0/b/medapp-8793f.appspot.com/o/SaveInsta.App%20-%203155551423668174495.mp4?alt=media&token=4ae7b9cb-0258-4b56-9b7e-33741666e8c2&_gl=1*1rnkuyg*_ga*NjMzNTYwODcyLjE2ODg0ODQ4NjQ.*_ga_CW55HF8NVT*MTY5ODM5Mzc5Mi4yNC4xLjE2OTgzOTU3NTMuNjAuMC4w",
      'isCached': false,
      'file': null
    },
    {
      'type': 'image',
      'url':
          "https://i.pinimg.com/236x/7e/49/38/7e493815537deb6ee7f5f73cdccae4f0.jpg",
      'isCached': false,
      'file': null
    },
    {
      'type': 'image',
      'url': "https://i.insider.com/601441dd6dfbe10018e00c25?width=700",
      'isCached': false,
      'file': null
    },
    {
      'type': 'image',
      'url':
          "https://image.lexica.art/full_jpg/0b8dfa8b-cd14-4c0c-ae15-4bf8c54b0e2a",
      'isCached': false,
      'file': null
    },
    {
      'type': 'image',
      'url':
          "https://usa.bootcampcdn.com/wp-content/uploads/sites/106/2022/02/shutterstock_1232410558-800x412.png",
      'isCached': false,
      'file': null
    },
    {
      'type': 'image',
      'url':
          "https://img.etimg.com/thumb/width-640,height-480,imgsize-25544,resizemode-75,msid-103818150/opinion/bliss-of-everyday-life/following-memes.jpg",
      'isCached': false,
      'file': null
    },
    {
      'type': 'image',
      'url':
          "https://ww2.kqed.org/app/uploads/sites/38/2019/03/tomemeornot3-672x372.jpg",
      'isCached': false,
      'file': null
    },
    {
      'type': 'image',
      'url':
          "https://i0.wp.com/xaviernewswire.com/wp-content/uploads/2020/02/art.jpg?fit=948%2C572&ssl=1",
      'isCached': false,
      'file': null
    },
    {
      'type': 'image',
      'url':
          "https://assets.mycast.io/actor_images/actor-iron-man-marvel-cinematic-universe-598512_large.jpg?1668875667",
      'isCached': false,
      'file': null
    },
    {
      'type': 'image',
      'url':
          "https://upload.wikimedia.org/wikipedia/commons/6/6e/Shah_Rukh_Khan_graces_the_launch_of_the_new_Santro.jpg",
      'isCached': false,
      'file': null
    },
  ];

  @override
  void initState() {
    processVideoData();
    super.initState();
  }

  checkRange(index) {
    // print(indexc)
    if (index < 10 && (index == 2 || index == 5)) {
      return true;
    } else if (index > 10) {
      final data = index.toString().substring(index.toString().length - 1);

      // print(data);

      if (data == '2' || data == '5') {
        // print("%%%%%%%%%%%%%%%55");
        return true;
      }
    }

    return false;
  }

  Future<void> initiaLizeReels(index) async {
    await processVideoData();
    // setState(() {
    //   videoData[0]['controller']!.play();
    // });
  }

  Future getVideoData() async {
    // List<Map<String, dynamic>> feeData = [];
    final cData = await checkCacheForAll();

    print(cData);
    for (var i = 0; i < feedList.length; i++) {
      {
        final v = cData.indexWhere((d) => d!.originalUrl == feedList[i]['url']);

        print("$v => ${feedList[i]['url']}");

        if (v != -1) {
          setState(() {
            feedList[i]['file'] = cData[v]!.file;
            feedList[i]['isCached'] = true;
          });
        } else {
          setState(() {
            feedList[i]['file'] = null;
            feedList[i]['isCached'] = false;
          });
        }
      }
    }

    // return vData;
  }

  Future<void> processVideoData() async {
    await getVideoData();
    print(feedList);
    // return;
    // setState(() {
    //   ree = vdata;
    // });

    for (var i = 0; i < feedList.length; i++) {
      if (feedList[i]['type'] == 'reel') {
        setState(() {
          reelsIndexes.add(i);
        });
        if (feedList[i]['isCached'] == true) {
          feedList[i]['controller'] =
              VideoPlayerController.file(feedList[i]['file']);

          feedList[i]['controller']!.initialize().then((value) {
            feedList[i]['controller']!.setVolume(0.0);
          });
        } else {
          feedList[i]['controller'] =
              VideoPlayerController.networkUrl(Uri.parse(feedList[i]['url']));
          feedList[i]['controller']!.initialize().then((value) {
            // print("I am here 3...........");
            feedList[i]['controller']!.setVolume(0.0);
            setState(() {});
            cachedForUrl(feedList[i]['url']);
          });
        }
      }
    }

    setState(() {});
  }

  Future<FileInfo?> checkCacheFor(String url) async {
    final FileInfo? value = await DefaultCacheManager().getFileFromCache(url);
    return value;
  }

  Future<List<FileInfo?>> checkCacheForAll() async {
    final List<FileInfo?> infoList = [];
    for (var feefUrl in feedList) {
      final data = await DefaultCacheManager().getFileFromCache(feefUrl['url']);
      if (data != null) {
        infoList.add(data);
      }
    }
    return infoList;
  }

  void cachedForUrl(String url) async {
    await DefaultCacheManager().getSingleFile(url);
  }

  @override
  void dispose() {
    if (feedList.isNotEmpty) {
      for (var f in feedList) {
        if (f['type'] == 'reel') {
          f['controller']!.dispose();
        }
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            MasonryGridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 4,
              crossAxisSpacing: 3,
              itemCount: feedList.length,
              itemBuilder: (context, index) {
                final f = feedList[index];

                // return SizedBox();

                return f['type'] == 'reel'
                    ? GestureDetector(
                        onTap: () {
                          reelController.videoUrl.value = f['url'];
                          mainScreenController.bottomNavIndex.value = 2;
                          instaController.isDarModeOn.value = true;
                          instaController.reelModeChange();
                        },
                        child: VisibilityDetector(
                          key: Key(index.toString()),
                          onVisibilityChanged: (visibilityInfo) {
                            var visiblePercentage =
                                visibilityInfo.visibleFraction * 100;

                            final data = visibilityInfo.key;

                            debugPrint(
                                'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');

                            if (visiblePercentage > 75) {
                              // print(visibleIndex.contains(index));
                              if (!visibleIndex.contains(index)) {
                                visibleIndex.add(index);
                                visibleIndex.sort();
                              }
                              setState(() {});
                            } else {
                              if (visibleIndex.contains(index)) {
                                visibleIndex.remove(index);
                                visibleIndex.sort();
                              }
                              setState(() {});
                            }
                            print(visibleIndex);

                            if (visibleIndex.contains(index)) {
                              setState(() {
                                feedList[index]['controller']!.pause();
                                feedList[visibleIndex.first]['controller']!
                                    .play();
                              });
                            }
                          },
                          child: Container(
                            // width: 40,
                            height: checkRange(index) ? 254 : 125,
                            color: Colors.grey.withOpacity(0.3),
                            child: f['controller'] == null
                                ? null
                                : VideoPlayer(
                                    f['controller']!,
                                    key: Key(index.toString()),
                                  ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          // reelController.videoUrl.value = f['url'];
                          // mainScreenController.bottomNavIndex.value = 2;
                          // instaController.isDarModeOn.value = true;
                          // instaController.reelModeChange();
                        },
                        child: Container(
                          // width: 40,
                          height: checkRange(index) ? 254 : 125,
                          color: Colors.grey.withOpacity(0.3),
                          child: f['isCached']
                              ? Image.file(
                                  f['file'],
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  f['url'],
                                  fit: BoxFit.cover,
                                ),
                        ),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
