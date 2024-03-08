import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static var client = http.Client();

  static Future<dynamic> postData(String apiUrl, dynamic payload) async {
    dynamic jsonResponse;
    // Map<String, String> header = {};
    try {
      final response = await client.post(
        Uri.parse(apiUrl),
        body: json.encode(payload),
        headers: {"Content-type": "application/json"},
      );
      log("DETAILS:: URL::=> ${apiUrl.split("staging").last}\nPAYLOAD::=> ${json.encode(payload)} ");
      if (response.statusCode == 200) {
        jsonResponse = jsonDecode(response.body);
        if (kDebugMode) {
          print(response.body);
        }
        return jsonResponse;
      } else {
        log('Error: $apiUrl ::=> StatusCode:: ${response.statusCode}');

        return jsonResponse;
      }
    } catch (e, stackTrace) {
      log(
        'Error:  $apiUrl  , Exception:: $e  \n::=> StackTrace::=> $stackTrace',
      );
      return jsonResponse;
    }
  }
}
