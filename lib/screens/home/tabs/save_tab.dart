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
                    item['clothingTitle'],
                    item['clothingId'],
                    item['image1URL'],
                    item['image2URL'],
                    item['image3URL'],
                    item['image4URL'],
                    item['image5URL'],
                    item['image6URL'],
                    item['contentRating'],
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
                title: item['clothingTitle'],
                imageUrl: item['image1URL'],
                contentRating: item['contentRating'],
                description: item['description'],
                originalLanguage: item['clothingTitle'],
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