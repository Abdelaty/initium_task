import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NetworkHelper {
  NetworkHelper(this.url, this.customerMap);

  final String url;

  final Map<String, String> customerMap;
  final Map<String, String> headersMap = {'content-type': 'application/json'};

  Future sendData() async {
    http.Response response = await http.post(url,
        headers: headersMap, body: jsonEncode(customerMap));

    if (response.statusCode == 200) {
      print('Response Code is ' + response.statusCode.toString());
      print('Response body is ' + response.body);
      return response.statusCode;
    } else {
      print('Response Code is ' + response.statusCode.toString());
      print('Response body is ' + response.body);
      customerMap.forEach((key, value) {
        print(value);
      });
    }
  }

  Future sendLoginData() async {
    http.Response response = await http.post(url,
        headers: headersMap, body: jsonEncode(customerMap));

    if (response.statusCode == 200) {
      print('Response Code is ' + response.statusCode.toString());
      print('Response body is ' + response.body);
      saveLoginInfo(response);

      return response.statusCode;
    } else {
      print('Response Code is ' + response.statusCode.toString());
      print('Response body is ' + response.body);
      customerMap.forEach((key, value) {
        print(value);
      });
    }
  }

  Future<void> saveLoginInfo(http.Response response) async {
    var preferences = await SharedPreferences.getInstance();
    var body = jsonDecode(response.body);
    preferences.setString('firstName', body['FirstName']);
    preferences.setString('lastName', body['LastName']);
    print(preferences.get('lastName'));
  }
}
