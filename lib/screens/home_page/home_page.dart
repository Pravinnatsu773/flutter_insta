import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isReadMore = false;
  bool loading = true;
  int readMoreIndex = 0;
  String desc =
      'Lorem ipsum dolor sit amet. Sed quia eligendi et laudantium ducimus et vero reiciendis qui distinctio nihil. Et consequatur ipsa rem excepturi culpa et quis quis quo consequatur quia non excepturi voluptas. In sapiente eveniet At dignissimos nesciunt quo iste eligendi qui eius provident ut quisquam expedita. Qui dolore fugit aut quia sunt ea tempora magnam sit fugit dolores et explicabo pariatur qui praesentium fugit quo unde quod';

  List<Map<String, dynamic>> postList = [
    {
      'img':
          'https://firebasestorage.googleapis.com/v0/b/medapp-8793f.appspot.com/o/288477092_697797527994120_9176574373354933467_n.jpg?alt=media&token=656555fa-901b-40c0-8527-6cc2a437e35e&_gl=1*1oavoo2*_ga*NjMzNTYwODcyLjE2ODg0ODQ4NjQ.*_ga_CW55HF8NVT*MTY5ODQ5NDI5OS4yNy4xLjE2OTg0OTQzODIuNDEuMC4w',
      'isReadMore': false,
      'isCached': false,
      'file': null
    },
    {
      'img':
          "https://lh3.googleusercontent.com/-Ue5h6OOJ1tY/ZL3_D4R16hI/AAAAAAAAu_w/zDANIDVBQWodat4TgP-4FVF4gyHEQq10wCNcBGAsYHQ/s0/Fairy-Tail-Filler-List-Episodes-to-Skip.jpg",
      'isReadMore': false,
      'isCached': false,
      'file': null
    },
    {
      'img':
          "https://easternmirrornagaland.com/wp-content/uploads/2023/01/Pathaan-the-movie-starring-Shah-Rukh-Khan-and-Deepika-Padukone.jpg",
      'isReadMore': false,
      'isCached': false,
      'file': null
    },
    {
      'img':
          "https://firebasestorage.googleapis.com/v0/b/medapp-8793f.appspot.com/o/287871682_715568739695494_9030700108431672027_n.jpg?alt=media&token=47cef822-c453-475f-ac28-71113c313822&_gl=1*1u354o9*_ga*NjMzNTYwODcyLjE2ODg0ODQ4NjQ.*_ga_CW55HF8NVT*MTY5ODQ5NDI5OS4yNy4xLjE2OTg0OTQ0NjYuMzcuMC4w",
      'isReadMore': false,
      'isCached': false,
      'file': null
    },
    {
      'img':
          "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg",
      'isReadMore': false,
      'isCached': false,
      'file': null
    },
    {
      "img":
          "https://www.top10about.com/wp-content/uploads/2018/01/Tom-Cruise.jpg",
      'isReadMore': false,
      'isCached': false,
      'file': null
    },
    {
      "img":
          "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg",
      'isReadMore': false,
      'isCached': false,
      'file': null
    },
    {
      "img":
          "https://upload.wikimedia.org/wikipedia/commons/6/6e/Shah_Rukh_Khan_graces_the_launch_of_the_new_Santro.jpg",
      'isReadMore': false,
      'isCached': false,
      'file': null
    },
    {
      'img':
          'https://firebasestorage.googleapis.com/v0/b/medapp-8793f.appspot.com/o/288477092_697797527994120_9176574373354933467_n.jpg?alt=media&token=656555fa-901b-40c0-8527-6cc2a437e35e&_gl=1*1oavoo2*_ga*NjMzNTYwODcyLjE2ODg0ODQ4NjQ.*_ga_CW55HF8NVT*MTY5ODQ5NDI5OS4yNy4xLjE2OTg0OTQzODIuNDEuMC4w',
      'isReadMore': false,
      'isCached': false,
      'file': null
    },
    {
      'img':
          "https://lh3.googleusercontent.com/-Ue5h6OOJ1tY/ZL3_D4R16hI/AAAAAAAAu_w/zDANIDVBQWodat4TgP-4FVF4gyHEQq10wCNcBGAsYHQ/s0/Fairy-Tail-Filler-List-Episodes-to-Skip.jpg",
      'isReadMore': false,
      'isCached': false,
      'file': null
    },
    {
      'img':
          "https://easternmirrornagaland.com/wp-content/uploads/2023/01/Pathaan-the-movie-starring-Shah-Rukh-Khan-and-Deepika-Padukone.jpg",
      'isReadMore': false,
      'isCached': false,
      'file': null
    },
    {
      'img':
          "https://firebasestorage.googleapis.com/v0/b/medapp-8793f.appspot.com/o/287871682_715568739695494_9030700108431672027_n.jpg?alt=media&token=47cef822-c453-475f-ac28-71113c313822&_gl=1*1u354o9*_ga*NjMzNTYwODcyLjE2ODg0ODQ4NjQ.*_ga_CW55HF8NVT*MTY5ODQ5NDI5OS4yNy4xLjE2OTg0OTQ0NjYuMzcuMC4w",
      'isReadMore': false,
      'isCached': false,
      'file': null
    },
    {
      'img':
          "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg",
      'isReadMore': false,
      'isCached': false,
      'file': null
    },
    {
      "img":
          "https://www.top10about.com/wp-content/uploads/2018/01/Tom-Cruise.jpg",
      'isReadMore': false,
      'isCached': false,
      'file': null
    },
    {
      "img":
          "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg",
      'isReadMore': false,
      'isCached': false,
      'file': null
    },
    {
      "img":
          "https://upload.wikimedia.org/wikipedia/commons/6/6e/Shah_Rukh_Khan_graces_the_launch_of_the_new_Santro.jpg",
      'isReadMore': false,
      'isCached': false,
      'file': null
    }
  ];

  List<Map<String, dynamic>> storyData = [
    {
      'profilePic':
          "https://instagram.fpnq13-2.fna.fbcdn.net/v/t51.2885-19/279076380_406902630898235_2083113449618352146_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fpnq13-2.fna.fbcdn.net&_nc_cat=111&_nc_ohc=gq-Anvb7xnsAX_cHFfK&edm=ACWDqb8BAAAA&ccb=7-5&oh=00_AfAaox_DZ78guTPlk1R4OmI-EfvSNdC9EklwO1H7ApLf-g&oe=65416ED5&_nc_sid=ee9879",
      'username': 'pravinnatsu'
    },
    {
      'profilePic': "https://xsgames.co/randomusers/assets/avatars/male/74.jpg",
      'username': 'elbert232'
    },
    {
      'profilePic': "https://randomuser.me/api/portraits/women/76.jpg",
      'username': 'lisa09472'
    },
    {
      'profilePic':
          "https://img.freepik.com/free-photo/handsome-man-wearing-glasses_23-2148696634.jpg?size=626&ext=jpg&ga=GA1.1.867424154.1697846400&semt=ais",
      'username': 'jackthespider'
    },
    {
      'profilePic':
          "https://i.pinimg.com/280x280_RS/a8/c1/19/a8c119c7c6aaada90f6e0963ff9da74e.jpg",
      'username': 'thisisadam'
    },
    {
      'profilePic': "https://xsgames.co/randomusers/assets/avatars/male/46.jpg",
      'username': 'iamandrew'
    },
    {
      'profilePic': "https://xsgames.co/randomusers/assets/avatars/male/6.jpg",
      'username': 'indiecoder'
    }
  ];

  @override
  void initState() {
    checkCacheForAll();
    super.initState();
  }

  void cachedForUrl(String url) async {
    await DefaultCacheManager().getSingleFile(url);
  }

  Future checkCacheForAll() async {
    setState(() {
      loading = true;
    });
    // final List<FileInfo?> infoList = [];
    // for (var post in postList) {}

    for (var i = 0; i < postList.length; i++) {
      final data =
          await DefaultCacheManager().getFileFromCache(postList[i]['img']);
      if (data != null) {
        print(data);
        setState(() {
          postList[i]['file'] = data.file;
          postList[i]['isCached'] = true;
        });
      }

      if (i == postList.length - 1) {
        setState(() {
          loading = false;
        });
      }
    }
    // return infoList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              'assets/instagram-wordmark.svg',
                              width: 120,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.favorite_outline,
                                  size: 28,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                SvgPicture.asset(
                                  'assets/messenger_icon_143737.svg',
                                  width: 24,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                          padding: const EdgeInsets.only(left: 16),
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: storyData.length,
                              itemBuilder: (context, index) {
                                return storyCircle(
                                    context, index, storyData[index]);
                              })),
                      const Divider(
                        thickness: 0.8,
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: postList.length,
                          itemBuilder: (context, index) =>
                              feedContent(index, postList[index]))
                    ],
                  ),
                ),
              ));
  }

  Widget feedContent(index, post) {
    cachedForUrl(post['img']);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.purple,
                          Colors.pink,
                          Colors.orange,
                        ],
                      ),
                      // color: color,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      // width: 65,
                      // height: 65,
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: CircleAvatar(
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(140)),
                          child: Image.network(
                            'https://instagram.fpnq13-2.fna.fbcdn.net/v/t51.2885-19/279076380_406902630898235_2083113449618352146_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fpnq13-2.fna.fbcdn.net&_nc_cat=111&_nc_ohc=gq-Anvb7xnsAX_cHFfK&edm=ACWDqb8BAAAA&ccb=7-5&oh=00_AfAaox_DZ78guTPlk1R4OmI-EfvSNdC9EklwO1H7ApLf-g&oe=65416ED5&_nc_sid=ee9879',
                            fit: BoxFit.cover,
                            // width: 65,
                            // height: 65,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    'pravinnatsu',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: Colors.grey.withOpacity(0.15)),
                    child: Text(
                      'Follow',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  const Icon(Icons.more_vert),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
            // height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: post['isCached']
                ? Image.file(
                    post['file'],
                  )
                : Image.network(
                    post['img'],
                    fit: BoxFit.cover,
                  )),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.favorite_outline,
                    // color: Colors.white,
                    size: 32,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.comment_outlined,
                      // color: Colors.white,
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  const Icon(
                    Icons.send,
                    // color: Colors.white,
                    size: 32,
                  ),
                ],
              ),
              const Icon(
                Icons.bookmark_outline_rounded,
                size: 32,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(
                '223 likes',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 32,
                child: RichText(
                  // Controls visual overflow
                  // overflow: TextOverflow.ellipsis,

                  // Controls how the text should be aligned horizontally
                  textAlign: TextAlign.start,

                  // Control the text direction
                  // textDirection: TextDirection.rtl,

                  // Whether the text should break at soft line breaks
                  softWrap: true,

                  // Maximum number of lines for the text to span
                  maxLines: null,

                  // The number of font pixels for each logical pixel
                  textScaleFactor: 1,

                  text: TextSpan(
                    text: 'pravinnatsu ',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: isReadMore && index == readMoreIndex
                              ? desc
                              : '${desc.substring(0, 65)}... ',
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black)
                          // style: ,
                          ),
                      TextSpan(
                        text:
                            isReadMore && index == readMoreIndex ? '' : 'more',

                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black54),

                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              isReadMore = true;
                              readMoreIndex = index;
                            });
                          },
                        // style: ,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget storyCircle(context, int index, data) {
    return SizedBox(
      // margin: const EdgeInsets.only(right: 16),
      width: 95,
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(2.5),
            decoration: BoxDecoration(
              gradient: index == 0
                  ? null
                  : const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.purple,
                        Colors.pink,
                        Colors.orange,
                      ],
                    ),
              // color: color,
              shape: BoxShape.circle,
            ),
            child: Container(
              // width: 65,
              // height: 65,
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: CircleAvatar(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(140)),
                  child: Image.network(
                    data['profilePic'],
                    fit: BoxFit.cover,
                    // width: 65,
                    // height: 65,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              index == 0 ? 'Your story' : data['username'],
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
