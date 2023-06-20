import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<String>> fetchImageFromApi() async {
  List<String> imagesUrl = [];
  final Uri uri = Uri.parse('https://picsum.photos/v2/list');

  try{
    var jsonData = await http.get(uri);
    if (jsonData.statusCode == 200) {
      var fetchData = jsonDecode(jsonData.body);
      print('Response: ${jsonData.body}');
      for (var element in fetchData) {
        imagesUrl.add(element['download_url']);
      }
    } else {
      // Request failed
      print('Request failed with status: ${jsonData.statusCode}');
    }
  }catch(e){
    print('Error: $e');
  }
  return imagesUrl;
}