import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../api_error_handlers.dart';
import '../../box_functions.dart';

class ApiServiceDio {
  final Dio dioRequest = Dio();

  Future<void> postMultiPartRequest({
    required String url,
    required void Function(dynamic) onSuccess,
    required void Function() onError,
    required FormData formData,
    required void Function(int, int)? uploadingProgress,
    bool forceAuth = false,
  }) async {
    try {
      late final Response response;
      if (forceAuth) {
        final authHeaders = await _useAuthHeader();
        response = await dioRequest.post(
          url,
          data: formData,
          onSendProgress: uploadingProgress,
          options: Options(
            headers: authHeaders,
          ),
        );
      } else {
        response = await dioRequest.post(
          url,
          data: formData,
          onSendProgress: uploadingProgress,
        );
      }

      Map<String, dynamic> jsonDecodedResponse = response.data;
      int statusCode = response.statusCode ?? 401;
      if (statusCode >= 200 && statusCode < 300) {
        onSuccess(jsonDecodedResponse);
      }
    } on DioException catch (e) {
      ApiErrorHandlers.handleHttpErrors(
        errorStatusCode: e.response?.statusCode,
        apiErrorMessage: e.response?.data["message"],
      );
      onError();
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

  Future<void> putMultiPartRequest({
    required String url,
    required void Function(dynamic) onSuccess,
    required void Function() onError,
    required FormData formData,
    required void Function(int, int)? uploadingProgress,
    bool forceAuth = false,
  }) async {
    try {
      late final Response response;
      if (forceAuth) {
        final authHeaders = await _useAuthHeader();
        response = await dioRequest.put(
          url,
          data: formData,
          onSendProgress: uploadingProgress,
          options: Options(
            headers: authHeaders,
          ),
        );
      } else {
        response = await dioRequest.put(
          url,
          data: formData,
          onSendProgress: uploadingProgress,
        );
      }

      Map<String, dynamic> jsonDecodedResponse = response.data;
      int statusCode = response.statusCode ?? 401;
      if (statusCode >= 200 && statusCode < 300) {
        onSuccess(jsonDecodedResponse);
      }
    } on DioException catch (e) {
      ApiErrorHandlers.handleHttpErrors(
        errorStatusCode: e.response?.statusCode,
        apiErrorMessage: e.response?.data["message"],
      );
      onError();
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

  Future<dynamic> _useAuthHeader() async {
    String getUserToken = await BoxFunctions().getToken();
    return {
      "Authorization": "Bearer $getUserToken",
      'Content-Type': 'multipart/form-data',
    };
  }
}
