

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wishlist/helpers/constants/constants.dart';
import '../../../helpers/constants/app_colors.dart';
import '../../../helpers/constants/app_constants.dart';
import '../../../helpers/constants/app_logger.dart';
import '../../../helpers/widgets/app_text.dart';
import '../home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';


class DetailTab extends StatefulWidget {
  DetailTab({super.key});

  @override
  State<StatefulWidget> createState()  => _DetailTabState();
}

class _DetailTabState extends State<DetailTab> {
  final HomeViewController homeController = Get.put(HomeViewController());
  AppPrinter appPrinter = AppPrinter();

  @override
  void initState() {
    super.initState();
  }
  List<Widget> populateCarosuelItems(){
    List<Widget> tempCarouselItems = [];
    if (homeController.imageURL2.value.isNotEmpty){
      tempCarouselItems.add(
        ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Opacity(opacity: 1,
              child: Image.network(
                homeController.imageURL2.value,
                fit: BoxFit.cover,
              ),
            )
        ),
      );
    }
    if (homeController.imageURL3.value.isNotEmpty){
      tempCarouselItems.add(
        ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Opacity(opacity: 1,
              child: Image.network(
                homeController.imageURL3.value,
                fit: BoxFit.cover,
              ),
            )
        ),
      );
    }
    if (homeController.imageURL4.value.isNotEmpty){
      tempCarouselItems.add(
        ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Opacity(opacity: 1,
              child: Image.network(
                homeController.imageURL4.value,
                fit: BoxFit.cover,
              ),
            )
        ),
      );
    }
    if (homeController.imageURL5.value.isNotEmpty){
      tempCarouselItems.add(
        ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Opacity(opacity: 1,
              child: Image.network(
                homeController.imageURL5.value,
                fit: BoxFit.cover,
              ),
            )
        ),
      );
    }
    if (homeController.imageURL6.value.isNotEmpty){
      tempCarouselItems.add(
        ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Opacity(opacity: 1,
              child: Image.network(
                homeController.imageURL6.value,
                fit: BoxFit.cover,
              ),
            )
        ),
      );
    }
    return tempCarouselItems;
  }

  Future<void> _launchURL(url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> carouselItems = populateCarosuelItems();
    String price = homeController.price.value;

    return  Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: const BackButton(
          color: AppColors.accentColor,
        ),
        backgroundColor: AppColors.backgroundColor,
        title: Row(
            children: [
              Expanded(child:
                AppText(
                  text: homeController.clothingTitle.value,
                  color: AppColors.accentColor,
                  fontSize: AppConstants.subTitleFontSize,
                  fontFamily: AppConstants.fontFamily,
                ),
              )
            ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Obx(() => Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Opacity(
                            opacity: 1,
                            child:
                            Image.network(
                              homeController.imageURL1.value,
                              width: 220.0,
                              height: 260.0,
                              fit: BoxFit.fitHeight,
                            ),

                      ),

                    )
                  ],
                )),
                SizedBox(
                  height: 240,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: 'Brand:',
                        color: AppColors.textColor.withOpacity(0.7),
                        fontSize: 20,
                        maxLines: 3,
                      ),
                      AppText(
                        text: homeController.brand.value,
                        color: AppColors.accentColor,
                        fontSize: 20,
                        maxLines: 3,
                      ),
                      AppText(
                        text: 'Price:',
                        color: AppColors.textColor.withOpacity(0.7),
                        fontSize: 20,
                        maxLines: 3,
                      ),
                      AppText(
                        text: '\$$price',
                        color: AppColors.accentColor,
                        fontSize: 20,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 13,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AppText(
                text: 'Description:',
                color: AppColors.textColor.withOpacity(0.7),
                fontSize: 20,
                maxLines: 3,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Obx(() => AppText(
                text: homeController.description.value,
                color: AppColors.accentColor,
                fontSize: 16,
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
              )),
            ),

            CarouselSlider(
                items: carouselItems,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  viewportFraction: .4,
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child:
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child:
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          await _launchURL(homeController.url.value);
                        } catch(e) {
                          print(e.toString());
                        }
                      },
                      child: Container(
                        child:
                        const AppText(
                          text: 'Buy now',
                          color: AppColors.accentColor,
                          fontSize: 14,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}