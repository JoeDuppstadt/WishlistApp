

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
  int _counter = 0;
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
            if (homeController.clothingList.isNotEmpty) {
              print('Clothing List is not empty');
              itemTitle = homeController.clothingList[_counter]; // populate clothing list
            }
            if(homeController.clothingList.isNotEmpty) {
              return
                Row(
                  children: [
                    // populate the title for each item
                    /*Expanded(
                      child:
                      AppText(
                        text: itemTitle['title'],
                        color: AppColors.accentColor,
                        fontSize: AppConstants.subTitleFontSize,
                        fontFamily: AppConstants.fontFamily,
                        maxLines: 2,
                      )
                    )

                     */
                    AutoSizeText(
                      itemTitle['title'],
                      style: const TextStyle(
                        color: AppColors.accentColor,
                        fontSize: AppConstants.subTitleFontSize,
                        fontFamily: AppConstants.fontFamily,
                      ),
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                    )
                  ]
                );
            }else{
              return const AppText( // return an empty title text box if the list is empty
                text: '',
                color: AppColors.accentColor,
                fontSize: AppConstants.titleFontSize,
                fontFamily: AppConstants.fontFamily,
                maxLines: 1,
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
            child: Text('No clothes found.'),
          );
        }
        else{
          return
            SwipableStack(
              itemCount: homeController.clothingList.length,
              detectableSwipeDirections: const {
                SwipeDirection.right,
                SwipeDirection.left,
              },
              controller: _controller,
              stackClipBehaviour: Clip.none,
              onSwipeCompleted: (index, direction) {
                if (kDebugMode) {
                  print('$index, $direction');
                }
                _counter++;
              },
              horizontalSwipeThreshold: 0.8,
              verticalSwipeThreshold: 0.8,
              builder: (context, properties) {
                Map<String, dynamic> item = homeController.clothingList[properties.index];
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Opacity(opacity: 1,
                        child: Image.network(
                          item['imageurl1'],
                          fit: BoxFit.fitWidth,
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