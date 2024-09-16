import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';

import '../../api_error_handlers.dart';
import '../../box_functions.dart';

class ApiPutDelRequests extends GetConnect {
  Future<void> putRequest({
    required String url,
    required Map<String, dynamic> bodyData,
    required void Function(dynamic) onSuccess,
    required void Function() onError,
    bool useAuthToken = false,
    bool showErrorWidget = true,
  }) async {
    try {
      late final Response response;
      if (useAuthToken) {
        final authHeaders = await _useAuthHeader();
        response = await put(url, bodyData, headers: authHeaders);
      } else {
        response = await put(url, bodyData);
      }
      Map<String, dynamic> jsonDecodedResponse = response.body;
      int statusCode = response.statusCode ?? 401;
      if (statusCode >= 200 && statusCode < 300) {
        onSuccess(jsonDecodedResponse);
      } else {
        if (showErrorWidget) {
          ApiErrorHandlers.handleHttpErrors(
            errorStatusCode: response.statusCode,
            apiErrorMessage: jsonDecodedResponse['message'],
          );
        }
        onError();
      }
    } on SocketException {
      if (showErrorWidget) {
        ApiErrorHandlers.showErrorWidget(
            errorMessage: "Check your mobile or wifi connection");
      }
      onError();
    } on TimeoutException {
      if (showErrorWidget) {
        ApiErrorHandlers.showErrorWidget(errorMessage: "Timeout");
      }
      onError();
    } catch (e) {
      if (showErrorWidget) {
        ApiErrorHandlers.showErrorWidget(errorMessage: "Something went wrong");
      }
      onError();
    }
  }

  Future<void> deleteRequest({
    required String url,
    required void Function(dynamic) onSuccess,
    required void Function() onError,
    bool useAuthToken = false,
    bool showErrorWidget = true,
  }) async {
    try {
      print("the url is $url");
      late final Response response;
      if (useAuthToken) {
        final authHeaders = await _useAuthHeader();
        response = await delete(url, headers: authHeaders);
      } else {
        response = await delete(url);
      }
      Map<String, dynamic> jsonDecodedResponse = response.body;
      int statusCode = response.statusCode ?? 401;
      if (statusCode >= 200 && statusCode < 300) {
        onSuccess(jsonDecodedResponse);
      } else {
        if (showErrorWidget) {
          ApiErrorHandlers.handleHttpErrors(
            errorStatusCode: response.statusCode,
            apiErrorMessage: jsonDecodedResponse['message'],
          );
        }
        onError();
      }
    } on SocketException {
      if (showErrorWidget) {
        ApiErrorHandlers.showErrorWidget(
            errorMessage: "Check your mobile or wifi connection");
      }
      onError();
    } on TimeoutException {
      if (showErrorWidget) {
        ApiErrorHandlers.showErrorWidget(errorMessage: "Timeout");
      }
      onError();
    } catch (e) {
      if (showErrorWidget) {
        ApiErrorHandlers.showErrorWidget(errorMessage: "Something went wrong");
      }
      onError();
    }
  }

  Future<dynamic> _useAuthHeader() async {
    String getUserToken = await BoxFunctions().getToken();
    return {
      "Authorization": "Bearer $getUserToken",
    };
  }
}
