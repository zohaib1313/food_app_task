import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:food_application/models/Images.dart';

import 'ApiClient.dart';

class ApiCalls {
  static Dio _dio = ApiClient.getDio();

  static Future<Images> fetchAllImages(int pageNumber) async {
    print("Fetching images....");
    var response = await _dio
        .get("curated", queryParameters: {"per_page": 30, "page": pageNumber});

    var image;
    if (response.statusCode == 500) {
      Map<String, dynamic> map = json.decode(json.encode(response.data));
      image = Images.fromJson(map);
    } else if (response.statusCode == 200) {
      image = Images.fromJson(response.data);
    }

    return image;
  }
}
