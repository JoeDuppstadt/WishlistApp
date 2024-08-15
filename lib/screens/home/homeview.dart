import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wishlist/helpers/constants/constants.dart';
import 'package:wishlist/screens/home/tabs/home_tab.dart';
import 'package:wishlist/screens/home/tabs/save_tab.dart';

import '../../helpers/service/data_handler.dart';
import '../../helpers/widgets/app_text.dart';
import 'home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewController homeController = Get.put(HomeViewController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    homeController.fetchClothingList();

    print(homeController.clothingList.length);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Row(
          children: [
            AppText(
              text: AppConstants.appName,
              color: AppColors.accentColor,
              fontSize: AppConstants.titleFontSize,
              fontFamily: AppConstants.fontFamily,
            ),
          ],
        ),
    ),



        body: Center(
          child:  Obx(() {
            switch (homeController.setTabName.value) {
              case 'home':
                return  HomeTab();
              //case 'search':
              //  return const SearchTab();
              case 'saved':
                return const SaveTab();
              //case 'detail':
              //  return  DetailTab();
              default:
              return  const SaveTab();

              //return  const HomeTab();
            }
          }
          ),
        ),



    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    floatingActionButton: FloatingActionButton(
      backgroundColor: AppColors.accentColor,
      onPressed: () {
        homeController.setTabName('search');
      },
      shape: const CircleBorder(),
      child: const Icon(Icons.search, color: AppColors.searchButtonColor),
    ),

    bottomNavigationBar: BottomAppBar(
      height: 40,
      color: AppColors.backgroundColorSecondary,
      notchMargin: 20,
      shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  print('Home');
                  homeController.selectedTab('home');
                },
                icon: const Icon(Icons.home_outlined, color: AppColors.accentColor,),
            ),
            Container(width: 100,),

            IconButton(
              onPressed: () {
                print('Saved');
                homeController.selectedTab('saved');
              },
              icon: const Icon(Icons.bookmark_border, color: AppColors.accentColor,),
            ),
          ],
        ),
    ));
  }
}
