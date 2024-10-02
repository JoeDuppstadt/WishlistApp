

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipable_stack/swipable_stack.dart';

import '../../../helpers/constants/app_colors.dart';
import '../../../helpers/constants/app_constants.dart';
import '../../../helpers/constants/app_logger.dart';
import '../../../helpers/widgets/app_text.dart';
import '../home_controller.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<StatefulWidget> createState()  => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final HomeViewController homeController = Get.put(HomeViewController());
  AppPrinter appPrinter = AppPrinter();
  late final SwipableStackController _controller;

  void _listenController() => setState(() {});
  int _swipecounter = 0;
  int _imagecounter = 0;
  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController()..addListener(_listenController);

  }
  @override
  Widget build(BuildContext context) {
    //print(homeController.clothingList.length);
    return  Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        iconTheme: const IconThemeData(
            color: AppColors.accentColor
        ),

        title: Obx(() {
          if (homeController.isLoading.value) {
            return const Center(
              child: Text(''),
            );
          } else {
            Map<String, dynamic> itemTitle = {}; // initialize empty list

            if(homeController.clothingList.isNotEmpty && _swipecounter != homeController.clothingList.length) {
              itemTitle = homeController.clothingList[_swipecounter]; // populate clothing list
              return
                Row(
                  children: [
                    Expanded(child:
                      AutoSizeText(
                        itemTitle['title'],
                        style: const TextStyle(
                          color: AppColors.accentColor,
                          fontSize: AppConstants.subTitleFontSize,
                          fontFamily: AppConstants.fontFamily,
                        ),
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                      ),
                    )
                  ]
                );
            }else{
              return const Center(
                child: Text('No more clothes available.'),
              );
            }
            }
        }),
        ),
      body: Obx(() {
        if (homeController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.accentColor,), // Show circular progress indicator
          );
        }
        else if (homeController.clothingList.isEmpty) {
          return const Center(
            child: Text(''),
          );
        }
        else{
          Map<String, dynamic> item = homeController.clothingList[_swipecounter];
          return
            SwipableStack(
              itemCount: 100,
              detectableSwipeDirections: const {
                SwipeDirection.right,
                SwipeDirection.left,
              },
              controller: _controller,
              stackClipBehaviour: Clip.none,
              onSwipeCompleted: (index, direction) {
                if(direction == SwipeDirection.right) {
                  _swipecounter++;
                }
                else{
                  homeController.clothingList.removeAt(_swipecounter);
                  item = homeController.clothingList[_swipecounter];
                }
              },
              horizontalSwipeThreshold: 0.8,
              verticalSwipeThreshold: 0.8,
              builder: (context, properties) {
                  return
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: Opacity(opacity: 1,
                            child: Image.network(
                                item['imageurl1'],
                                fit: BoxFit.fitWidth,
                                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null){
                                    return child; // image loaded
                                  }
                                  else{
                                    return Center(
                                        child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                      : null,
                                      )
                                    );
                                  }
                                },
                            ),
                          ),
                        ),
                      ],
                    );
              },
            );
        }
      }),


    );
  }
}