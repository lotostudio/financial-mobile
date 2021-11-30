import 'dart:convert';

import 'package:finance_app/models/user_model.dart';
import 'package:finance_app/services/api_constants.dart';
import 'package:http/http.dart' as http;

final String URL = APIConstants.BASE_URL;

class APIUserDetail {

  Future<UserModel> getUserData(token) async {
    final response = await http.get(
      Uri.parse('$URL/users/me'),
      headers: {
                "Authorization": 'Bearer ' + token
              }
    );
    if (response.statusCode == 200) {
      final responseMsg = jsonDecode(response.body);
      final firstName = responseMsg['firstName'];
      final lastName = responseMsg['lastName'];
      final email = responseMsg['email'];
      final authSucceed = true;

      return UserModel(
        firstName: firstName,
        lastName: lastName,
        email: email,
        authSucceed: authSucceed
      );
    } else {
      return UserModel(
        firstName: '',
        lastName: '',
        email: '',
        authSucceed: false
      );
    }
  }
}