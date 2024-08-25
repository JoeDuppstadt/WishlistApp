import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helpers/constants/app_colors.dart';
import '../../../helpers/widgets/clothingItem.dart';
import '../home_controller.dart';
import 'detail_tab.dart';

class SaveTab extends StatefulWidget {

  const SaveTab({super.key});

  @override
  State<SaveTab> createState() => _SaveTabState();
}

class _SaveTabState extends State<SaveTab> {
  final HomeViewController homeController = Get.put(HomeViewController());

  @override
  void initState() {
    // TODO: implement initState
    //homeController.clearAll();
    //homeController.searchManga('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Obx(() {
        if (homeController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.accentColor,), // Show circular progress indicator
          );
        } else if (homeController.clothingList.isEmpty) {
          return const Center(
            child: Text('No clothes found.'),
          );
        } else {
          return ListView.builder(
          itemCount: homeController.clothingList.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> item = homeController.clothingList[index];
            return InkWell(
              onTap: (){
                homeController.selectedTab('detail');
                homeController.tempData(
                    item['title'],
                    item['pid'],
                    item['imageurl1'],
                    item['imageurl2'],
                    item['imageurl3'],
                    item['imageurl4'],
                    item['imageurl5'],
                    item['imageurl6'],
                    item['description'],
                    item['brand'],
                    item['price']
                );
                Get.to(DetailTab(),
                  transition: Transition.topLevel,
                  duration: const Duration(seconds: 0)
                );
        },

              child: ClothingItemWidget(
                title: item['title'],
                imageUrl: item['imageurl1'],
                contentRating: item['contentRating'],
                description: item['description'],
                brand: item['brand'],
                price: item['price']
              ),
            );
          },
        );

        }
      }),
    );
  }
}