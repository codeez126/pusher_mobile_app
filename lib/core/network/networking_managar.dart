import 'package:base_project/core/services/connectivity_service.dart';
import 'package:base_project/core/utils/app_diologs.dart';
import 'package:dio/dio.dart';

import '../Managers/PrefManager.dart';
import '../constants/api_urls.dart';
import '../utils/utils.dart';

enum HttpMethod { get, post, put, patch, delete }

class NetworkManager {
  static final NetworkManager _singleton = NetworkManager._internal();
  factory NetworkManager() {
    return _singleton;
  }
  NetworkManager._internal();

  Dio dio = Dio();

  void setDioOptions() async {
    final token = PrefManager.getToken();
    dio.options.contentType = Headers.jsonContentType;
    if (token.isNotEmpty) {
      dio.options.headers.addAll({"Authorization": "Bearer $token"});
    }
  }

  Future<Response?> callApi({
    HttpMethod? method,
    required String urlEndPoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    dynamic body,
    bool isFormDataRequest = false,
    FormData? formData,
    Function Function(Response response)? onSuccess,
    Function Function(dynamic error)? onError,
    Function Function(bool isConnected)? onConnect,
    withoutLoader = false,
  }) async {
    bool isNet = await ConnectivityService.checkInternet();
    if (isNet) {
      setDioOptions();
      dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
      String requestURL;
      requestURL = ApiEndpoints.baseUrl + urlEndPoint;

      Utils.printData("Request URL: $requestURL");

      try {
        if (!withoutLoader) {
          Utils.showLoader();
        }
        switch (method) {
          case HttpMethod.get:
            Response response = await dio.get(
              requestURL,
              queryParameters: queryParameters,
              options: options,
            );
            if (!withoutLoader) Utils.hideLoader();

            return response;

          case HttpMethod.post:
            Response response = await dio.post(
              requestURL,
              queryParameters: queryParameters,
              options: options,
              cancelToken: cancelToken,
              onReceiveProgress: onReceiveProgress,
              data: isFormDataRequest ? formData : body,
            );
            if (!withoutLoader) Utils.hideLoader();

            return response;

          case HttpMethod.put:
            Response response = await dio.put(
              requestURL,
              queryParameters: queryParameters,
              options: options,
              cancelToken: cancelToken,
              onReceiveProgress: onReceiveProgress,
              data: body,
            );
            if (!withoutLoader) Utils.hideLoader();

            return response;

          case HttpMethod.patch:
            break;
          case HttpMethod.delete:
            Response response = await dio.delete(requestURL);

            if (!withoutLoader) Utils.hideLoader();

            return response;
          case null:
          // TODO: Handle this case.
        }
      } on DioException catch (error) {
        if (!withoutLoader) Utils.hideLoader();

        Map<String, dynamic>? errorResponse = error.response!.data;

        Utils.printData(error.message.toString());
        Response errResponse = Response(
          data: errorResponse,
          statusCode: error.response!.statusCode,
          requestOptions: RequestOptions(),
        );

        return errResponse;
      }

      return null;
    } else {
      AppDialogs.errorSnackBarTop("Check your internet");
    }
  }
}
