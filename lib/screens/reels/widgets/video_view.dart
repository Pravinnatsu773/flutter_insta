import 'package:flutter/material.dart';
import 'package:flutter_insta/utils/controllers/insta_controller.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

final _sheet = GlobalKey();
final _controller = DraggableScrollableController();

class VideoView extends StatefulWidget {
  const VideoView(
      {super.key,
      required this.callBack,
      required this.videoData,
      required this.currentIndex,
      required this.interactionCallBack,
      required this.showCompleteDesc});

  final Function(int) callBack;
  final Function interactionCallBack;

  final List<Map<String, dynamic>> videoData;

  final int currentIndex;

  final bool showCompleteDesc;

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  bool displayBottomSheet = false;
  final instaController = Get.isRegistered<InstaController>()
      ? Get.find<InstaController>()
      : Get.put(InstaController());

  checkForDarColor() {
    if (instaController.isDarModeOn.value) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.animateTo(
          0,
          duration: const Duration(milliseconds: 50),
          curve: Curves.easeInOut,
        );

        setState(() {
          displayBottomSheet = false;
        });
      },
      child: PageView.builder(
          onPageChanged: (int pageNum) {
            _controller.animateTo(
              0,
              duration: const Duration(milliseconds: 50),
              curve: Curves.easeInOut,
            );
            setState(() {
              displayBottomSheet = false;
            });
            widget.callBack(pageNum);
          },
          scrollDirection: Axis.vertical,
          itemCount: widget.videoData.length,
          itemBuilder: (context, index) {
            final v = widget.videoData[index];
            final List<String> tags = v['tags'];
            return (v['controller']! == null)
                ? const Text(
                    'wait..',
                    style: TextStyle(color: Colors.white),
                  )
                : Stack(
                    children: [
                      VideoPlayer(v['controller']!),
                      Positioned(
                          right: 16,
                          bottom: 16,
                          child: iterationOptions(context)),
                      Positioned(
                          bottom: 16,
                          left: 16,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50)),
                                      child: Image.network(
                                        v['profileImg'],
                                        width: 40,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      v['username'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: checkForDarColor(),
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 12),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 1),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Text(
                                        'Follow',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color: checkForDarColor(),
                                                fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    widget.interactionCallBack();
                                  },
                                  child: Text(
                                    widget.showCompleteDesc
                                        ? v['desc']
                                        : "${v['desc'].toString().substring(0, 35)}...",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            color: checkForDarColor(),
                                            fontWeight: FontWeight.normal),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                widget.showCompleteDesc
                                    ? Wrap(
                                        children: tags
                                            .map((e) => Text(
                                                  '#$e ',
                                                  style: TextStyle(
                                                    color: checkForDarColor(),
                                                  ),
                                                ))
                                            .toList(),
                                      )
                                    : const SizedBox()
                              ],
                            ),
                          )),
                      displayBottomSheet
                          ? _showCommentsSheet(context, v)
                          : const SizedBox()
                    ],
                  );
          }),
    );
  }

  Widget iterationOptions(context) {
    return Column(
      children: [
        const Icon(
          Icons.favorite_outline,
          color: Colors.white,
          size: 32,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          '6474',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: checkForDarColor(), fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
        ),
        GestureDetector(
          onTap: () {
            // _showCommentsSheet(context);
            _controller.animateTo(
              0.5,
              duration: const Duration(milliseconds: 50),
              curve: Curves.easeInOut,
            );
            setState(() {
              displayBottomSheet = true;
            });
          },
          child: const Icon(
            Icons.comment_outlined,
            color: Colors.white,
            size: 32,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          '46',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: checkForDarColor(), fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
        ),
        const Icon(
          Icons.send,
          color: Colors.white,
          size: 32,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          '271',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: checkForDarColor(), fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
        ),
        const Icon(
          Icons.more_vert_outlined,
          color: Colors.white,
          size: 32,
        ),
      ],
    );
  }

  _showCommentsSheet(BuildContext context, v) {
    return DraggableScrollableSheet(
      key: _sheet,
      initialChildSize: 0.5,
      maxChildSize: 1,
      minChildSize: 0,
      expand: true,
      snap: true,
      snapSizes: const [0.5],
      controller: _controller,
      builder: (BuildContext context, ScrollController scrollController) {
        return SafeArea(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Container(
              color: Colors.black87,
              child: CustomScrollView(
                shrinkWrap: true,
                controller: scrollController,
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    // leading: MediaQuery.of(context),
                    centerTitle: true,
                    leadingWidth: 0,

                    // expandedHeight: 20,
                    pinned: false,
                    title: Column(
                      children: [
                        Container(
                          width: 50,
                          height: 6,
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Comments',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: checkForDarColor(),
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SliverFillRemaining(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: Colors.grey.withOpacity(0.5),
                                  width: 1))),
                      child: SingleChildScrollView(
                        child: Column(
                          children: List<int>.generate(56, (index) => index)
                              .map((index) => Container(
                                    width: MediaQuery.of(context).size.width,
                                    // height: 40,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 6),

                                    alignment: Alignment.center,
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(50)),
                                            child: Image.network(
                                              v['profileImg'],
                                              width: 40,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    v['username'],
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                            color:
                                                                checkForDarColor(),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(
                                                    '3d',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                            color:
                                                                checkForDarColor(),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.6,
                                                child: Text(
                                                  v['desc'],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                          color:
                                                              checkForDarColor(),
                                                          fontWeight: FontWeight
                                                              .normal),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                'Reply',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons.favorite_outline,
                                            size: 18,
                                            color: Colors.grey,
                                          )
                                        ]),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        useSafeArea: true,
        backgroundColor: Colors.black,
        isScrollControlled: true,
        enableDrag: true,
        context: context,
        builder: (builder) {
          return Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
              ),
              Text(
                'Comments',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          );
        });
  }
}
