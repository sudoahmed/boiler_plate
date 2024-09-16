import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';

import '../../../../utils/box_functions.dart';
import '../../api_error_handlers.dart';

class ApiServiceWithHeaders extends GetConnect {
  Future<void> getRequest({
    required String url,
    required void Function(dynamic) onSuccess,
    required void Function() onError,
    bool showErrorWidget = true,
  }) async {
    String getUserToken = await BoxFunctions().getToken();
    final response = await get(
      url,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": "Bearer $getUserToken",
      },
    );
    Map<String, dynamic> jsonDecodedResponse = response.body;
    int statusCode = response.statusCode ?? 401;
    try {
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
    bool showErrorWidget = true,
  }) async {
    String getUserToken = await BoxFunctions().getToken();
    final response = await delete(
      url,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": "Bearer $getUserToken",
      },
    );
    Map<String, dynamic> jsonDecodedResponse = response.body;
    int statusCode = response.statusCode ?? 401;
    try {
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

  Future<void> postRequest({
    required String url,
    required Map<String, dynamic> bodyData,
    required void Function(dynamic) onSuccess,
    required void Function() onError,
    bool showErrorWidget = true,
  }) async {
    String getUserToken = await BoxFunctions().getToken();
    print(getUserToken);
    print("the url is : $url");
    try {
      final response = await post(
        url,
        bodyData,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "Bearer $getUserToken",
        },
      );
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

  Future<void> putRequest({
    required String url,
    required Map<String, dynamic> bodyData,
    required void Function(dynamic) onSuccess,
    required void Function() onError,
    bool showErrorWidget = true,
  }) async {
    String getUserToken = await BoxFunctions().getToken();
    print(getUserToken);
    try {
      final response = await put(
        url,
        bodyData,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "Bearer $getUserToken",
        },
      );
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
}
