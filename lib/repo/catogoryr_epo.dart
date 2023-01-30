import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gotrip/model/catogory_model.dart';
import 'package:http/http.dart' as http;

class ApiServices{


  static Welcome getUserDetails = Welcome();
  static  catogory() async {

      try {

      var response = await http.get(
      Uri.parse('https://restcountries.com/v2/all'),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('=== ${response.body}');
        getUserDetails = Welcome.fromJson(json.decode(response.body));
      return getUserDetails;
      } else {
      throw Exception('${response.statusCode}');
      }

      } catch (e) {
      debugPrint('$e');
      }
      return getUserDetails;
  }

}