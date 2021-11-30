import 'dart:convert';
import 'package:finance_app/services/api_constants.dart';
import 'package:http/http.dart' as http;

final String URL = APIConstants.BASE_URL;

class APIAuth {
  Future<String?> signIn(email, password) async {
    final response = await http.post(
        Uri.parse("$URL/auth/login"),
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password
        })
    );
    print('Status code - ' + response.statusCode.toString() + ' with body ' + response.body);
    if(response.statusCode == 200) {
      final responseMsg = jsonDecode(response.body);
      final token = responseMsg['accessToken'];
      print('This is token: $token');
      return token;
    } else {
      return null;
    }
  }

  Future<String?> register(firstName, lastName, email, password) async {

    bool regSuccess = false;

    final response = await http.post(
      Uri.parse("$URL/auth/register"),
      body: jsonEncode(<String, String>{
          'email': email,
          'firstName': firstName,
          'lastName': lastName,
          'password': password
        })
    );
    print('Response body - ' + response.body);
    print('Status Code - ' + response.statusCode.toString());
    if (response.statusCode == 201) {
      final res = await signIn(email, password);
      return res;
    } 
    // else {
    //   return regSuccess;
    // }
  }
}