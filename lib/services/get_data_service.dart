import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:research_20_06_2023/big_number_model/big_number_model.dart';

Future<BigNumberModel?> fetchDataFromApi() async {
  BigNumberModel? bigNumberModel;
  final Uri uri =  Uri.parse('https://wly10gv8ob.execute-api.ap-southeast-2.amazonaws.com/api/dashboard/big-numbers'); //YOUR_API
  const String token = 'eyJraWQiOiJpeVNJVkJSbW9xNWtxcEt6eFVVV1pTM2FDaHI1cGxpYWd3K3Q1S1BGYzgwPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiJjOGFjOGY0Ny00NDkxLTRkYTEtYTU0My05MDk2MWUzOWU5ODkiLCJ0b2tlbl91c2UiOiJhY2Nlc3MiLCJzY29wZSI6ImF3cy5jb2duaXRvLnNpZ25pbi51c2VyLmFkbWluIiwiYXV0aF90aW1lIjoxNjg3MjQ2MTA3LCJpc3MiOiJodHRwczpcL1wvY29nbml0by1pZHAuYXAtc291dGhlYXN0LTIuYW1hem9uYXdzLmNvbVwvYXAtc291dGhlYXN0LTJfcmdrNm1MaTBWIiwiZXhwIjoxNjg3MjQ5NzA3LCJpYXQiOjE2ODcyNDYxMDcsInZlcnNpb24iOjIsImp0aSI6IjFiNzQ3NzJlLTJiZjQtNGYyNS1iZDQwLWUzN2FiNGM1ZjQ3ZCIsImNsaWVudF9pZCI6ImY1b2UwMjdvdWgzaDdwYTIzdWlnM2hxc3AiLCJ1c2VybmFtZSI6ImM4YWM4ZjQ3LTQ0OTEtNGRhMS1hNTQzLTkwOTYxZTM5ZTk4OSJ9.qLRYDq0vwyaZ-28HaqzzxuROUEuNPKj5cXkblsLa5I_irGMEMV0FpD4na4FlaIIVETPjmlrQllf6w_QeuKtCcIVj6zQ7Rv03_ujB6rkx877PndujCqfJ69ysLGEAgPMGFEeNOMFiz_9aPvo2Qd7p9M_G4T4C6yFsFE4kH3UtC-27cpM58VGfAMk2HgLOa8u_LdLdcyOc4FRaZPlIz1WhoC5KeVtTgY8DFqZ1NZ_5noEYs-mYNIjhMWA-c0eYqAjWwuQ1AY_DR-GXTHjQm0djRfqFxmVUIapAJWssJYgq-dHJRCvNmA65jtA9Ez2R7O9lO09XVvbaf0d8imd-pjDOTg'; //YOUR_BEARER_TOKEN

  try{
    var response = await http.get(
      uri,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      var fetchData = jsonDecode(response.body);
      bigNumberModel = BigNumberModel.fromJson(fetchData);
      print('Response: ${response.body}');
    } else {
      // Request failed
      print('Request failed with status: ${response.statusCode}');
    }
  }catch(e){
    print('Error: $e');
  }
  return bigNumberModel;
}