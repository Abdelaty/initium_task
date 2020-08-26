import 'dart:convert';

import 'package:http/http.dart' as http;

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
}
