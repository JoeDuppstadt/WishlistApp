import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wishlist/helpers/service/api_service.dart';
import '../../helpers/constants/app_logger.dart';

class HomeViewController extends GetxController {

  var selectedIndex = 0.obs;
  var setTabName = 'home'.obs;
  List clothingList = [].obs;
  final clothingSavedList = [].obs;

  final savingList = [].obs;
  final retList = [].obs;
  final hashValue = ''.obs;
  var isLoading = false.obs;
  var isViewMore = false.obs;

  var showWarning = false.obs;
  var isConnected = false.obs;


  ///Temp Data
  var clothingTitle = ''.obs;
  var clothingId = ''.obs;
  var imageURL1 = ''.obs;
  var imageURL2 = ''.obs;
  var imageURL3 = ''.obs;
  var imageURL4 = ''.obs;
  var imageURL5 = ''.obs;
  var imageURL6 = ''.obs;
  var imageURL7 = ''.obs;
  var contentRating = ''.obs;
  //"createdAt": createdAt,
  //"updatedAt": updatedAt,
  var description = ''.obs;
  var brand = ''.obs;
  var price = ''.obs;
  /// Temp Data

  AppPrinter appPrinter = AppPrinter();

  Future<void> fetchClothingList() async {
    isLoading(true);
    try {
      List<Map<String, String>> fetchedClothingList = await ApiService().fetchActiveClothingData();
      clothingList = fetchedClothingList;
      appPrinter.printWithTag('Items in Controller',fetchedClothingList.toString());
      await Future.delayed(const Duration(seconds: 2));
      isLoading(false);
    } catch (e){
      appPrinter.printWithTag('Items in Controller',e.toString());
    }
  }

  Future<void> getChapterData() async {
    appPrinter.printWithTag('Manga ID :: ', clothingId.value);
  }

  void selectedTab(String name){
    setTabName.value = name;
    appPrinter.printWithTag('Tab Name', '$name');
  }

  void clearAll () {
    hashValue.value = "";
    //chapterFeed.clear();
    clothingList.clear();
    clothingSavedList.clear();
  }
  //For Detail Navigation
  void tempData(
    String clothingTitleX,
    String clothingIdX,
    String imageURL1X,
    String imageURL2X,
    String imageURL3X,
    String imageURL4X,
    String imageURL5X,
    String imageURL6X,
    String contentRatingX,
    //"createdAt": createdAt,
    //"updatedAt": updatedAt,
    String descriptionX,
    String brandX,
    String priceX
      ) {
      appPrinter.printWithTag('temp: clothingTitle',clothingTitleX);
      appPrinter.printWithTag('temp: clothingId',clothingIdX);
      appPrinter.printWithTag('temp: imageURL1',imageURL1X);
      appPrinter.printWithTag('temp: imageURL2',imageURL2X);
      appPrinter.printWithTag('temp: imageURL3',imageURL3X);
      appPrinter.printWithTag('temp: imageURL4',imageURL4X);
      appPrinter.printWithTag('temp: imageURL5',imageURL5X);
      appPrinter.printWithTag('temp: imageURL6',imageURL6X);
      appPrinter.printWithTag('temp: contentRatingX',contentRatingX);
      appPrinter.printWithTag('temp: descriptionX',descriptionX);
      appPrinter.printWithTag('temp: brandX',brandX);
      appPrinter.printWithTag('temp: priceX',priceX);
      clothingTitle.value = clothingTitleX;
      clothingId.value = clothingIdX;
      imageURL1.value  = imageURL1X;
      imageURL2.value = imageURL2X;
      imageURL3.value = imageURL3X;
      imageURL4.value = imageURL4X;
      imageURL5.value = imageURL5X;
      imageURL6.value = imageURL6X;
      contentRating.value = contentRatingX;
      description.value = descriptionX;
      brand.value = brandX;
      price.value = priceX;
  }
}