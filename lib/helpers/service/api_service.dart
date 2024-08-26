import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;


class ApiService {
  Future<List<Map<String, dynamic>>> fetchActiveClothingData() async {
    String? apiKey = dotenv.env['API_KEY'];
    String? url = dotenv.env['BASE_URL'];
    const String endpoint = '/getAllItems';
    Map<String, String> headers = {
      'X-API-KEY': apiKey!,
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    try{

      final response = await http.get( // send api request to return all items
        Uri.parse(url! + endpoint),
        headers: headers
      );
      if (response.statusCode == 200){
        List<Map<String, dynamic>> clothingList = [];
        List<dynamic> responseData = json.decode(response.body)[0];
        if (responseData.isNotEmpty) {
          for (var item in responseData) {
            Map<String, dynamic> itemAttributes = item;
            String pid = itemAttributes['PID'];
            String title = itemAttributes['Title'];
            String description = itemAttributes['Description'];
            String brand = itemAttributes['Brand'];
            String url = itemAttributes['URL'];
            String imageurl1 = itemAttributes['ImageURL1'];
            String imageurl2 = itemAttributes['ImageURL2'];
            String imageurl3 = itemAttributes['ImageURL3'];
            String? imageurl4 = itemAttributes['ImageURL4'] ?? '';
            String? imageurl5 = itemAttributes['ImageURL5'] ?? '';
            String? imageurl6 = itemAttributes['ImageURL6'] ?? '';
            String? imageurl7 = itemAttributes['ImageURL7'] ?? '';
            String price = itemAttributes['Price'];
            String? contentRating = itemAttributes['ContentRating'];

            Map<String, dynamic> itemJson = {
              'pid': pid,
              'title': title,
              'description': description,
              'brand': brand,
              'url': url,
              'imageurl1': imageurl1,
              'imageurl2': imageurl2,
              'imageurl3': imageurl3,
              'imageurl4': imageurl4,
              'imageurl5': imageurl5,
              'imageurl6': imageurl6,
              'imageurl7': imageurl7,
              'price': price,
              'contentRating': contentRating
            };
            clothingList.add(itemJson);
          }
          return clothingList;
        }
        else {
          throw Exception('No item data found in the response');
        }

      }else{
        throw Exception('Failed to retrieve items from api');
      }

    }catch (e) {
      throw Exception(e);
    }
  }

}