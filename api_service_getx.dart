import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import '../../api_error_handlers.dart';

class ApiServiceGetX extends GetConnect {
  Future<void> getRequest({
    required String url,
    required void Function(dynamic) onSuccess,
    required void Function() onError,
  }) async {
    final response = await get(url);
    Map<String, dynamic> jsonDecodedResponse = response.body;
    int statusCode = response.statusCode ?? 401;
    try {
      if (statusCode >= 200 && statusCode < 300) {
        onSuccess(jsonDecodedResponse);
      } else {
        ApiErrorHandlers.handleHttpErrors(
          errorStatusCode: response.statusCode,
          apiErrorMessage: jsonDecodedResponse['message'],
        );
        onError();
      }
    } on SocketException {
      ApiErrorHandlers.showErrorWidget(
          errorMessage: "Check your mobile or wifi connection");
      onError();
    } on TimeoutException {
      ApiErrorHandlers.showErrorWidget(errorMessage: "Timeout");
      onError();
    } catch (e) {
      ApiErrorHandlers.showErrorWidget(errorMessage: "Something went wrong");
      onError();
    }
  }

  Future<void> postRequest({
    required String url,
    required Map<String, dynamic> bodyData,
    required void Function(dynamic) onSuccess,
    required void Function() onError,
  }) async {
    print("The body data is $bodyData");
    try {
      final response = await post(url, bodyData);
      Map<String, dynamic> jsonDecodedResponse = response.body;
      int statusCode = response.statusCode ?? 401;
      if (statusCode >= 200 && statusCode < 300) {
        onSuccess(jsonDecodedResponse);
      } else {
        ApiErrorHandlers.handleHttpErrors(
          errorStatusCode: response.statusCode,
          apiErrorMessage: jsonDecodedResponse['message'],
        );
        onError();
      }
    } on SocketException {
      ApiErrorHandlers.showErrorWidget(
          errorMessage: "Check your mobile or wifi connection");
      onError();
    } on TimeoutException {
      ApiErrorHandlers.showErrorWidget(errorMessage: "Timeout");
      onError();
    } catch (e) {
      ApiErrorHandlers.showErrorWidget(errorMessage: "Something went wrong");
      onError();
    }
  }
}
