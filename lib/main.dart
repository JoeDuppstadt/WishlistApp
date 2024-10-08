import 'package:flutter/material.dart';
import 'package:wishlist/screens/error/errorview.dart';
import 'package:wishlist/screens/home/home_controller.dart';
import 'package:wishlist/screens/home/homeview.dart';
import 'helpers/constants/app_colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  runApp(const Wishlist());
}

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const Root(title: ''),
    );
  }
}

class Root extends StatefulWidget {
  const Root({super.key, required this.title});

  final String title;

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final HomeViewController homeController = Get.put(HomeViewController());
  @override
  void initState() {
    homeController.clearAll();
    homeController.fetchClothingList();
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      homeController.clothingList.isNotEmpty ?
      Get.offAll(
        HomeView(),
        transition: Transition.topLevel,
        //duration: const Duration(seconds: 1)
      ) :
      Get.offAll(
          Errorview(errorMessage: 'Please Try Again Soon!'),
          transition: Transition.topLevel
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFoldingCube(color: AppColors.accentColor,size: 100,),
          ],
        ),
      ),
    );
  }
}