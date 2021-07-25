import 'package:dio/dio.dart';
import 'package:food_application/services/chache/HiveService.dart';

import 'EndPoints.dart';

class ApiInterceptors extends InterceptorsWrapper {
  final HiveService hiveService = HiveService();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers = {"Authorization": EndPoints.API_KEY};
    options.connectTimeout = 5000;
    options.receiveTimeout = 5000;
    options.baseUrl = EndPoints.BASE_URL;

    print("requesting..${"image_cache_info"}.");
    bool exists = await hiveService.isExists(boxName: "image_cache_info");

    if (exists) {
      //  if data is present in database cache
      hiveService.getBoxes("image_cache_info").then(
        (boxList) {
          boxList.forEach(
            (element) {
              handler.resolve(
                Response(
                    requestOptions: options, data: element, statusCode: 500),
              );
            },
          );
        },
      );
    } else {
      // if no data in database cache
      handler.next(options);
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print("dio error ${err.toString()}");
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("dio response ${response.data}");
    hiveService.addBoxes(response.data, "image_cache_info");
    handler.next(response);
  }
}
