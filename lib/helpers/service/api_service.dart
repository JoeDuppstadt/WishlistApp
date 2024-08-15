import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Map<String, String>>> fetchActiveClothingData() async {
    const String url = 'http://127.0.0.1:8000/getAllItems';

    try{

      final response = await http.get( // send api request to return all items
        Uri.parse(url),
        headers: {"Content-Type": "application/json"}
      );
      if (response.statusCode == 200){
        List<Map<String, String>> clothingList = [];
        List<dynamic> responseData = json.decode(response.body);
        print(responseData[0].toString());
        print(responseData.length);
        Map<String, dynamic> map = json.decode(responseData[0].toString());
        //
        print(map['PID']);


        //Map<String, dynamic> responseData1 = json.decode(responseData[0].toString().replaceAll('[', ''). replaceAll(']', ''));
        //print(responseData1['PID']);

        if (responseData.isNotEmpty){
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