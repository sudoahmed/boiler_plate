import '../../screens/components/snack_bar_component.dart';

class ApiErrorHandlers {
  static void handleHttpErrors(
      {required int? errorStatusCode, String apiErrorMessage = ""}) {
    print("The error code is $errorStatusCode");
    if (errorStatusCode == 400) {
      showErrorWidget(errorMessage: apiErrorMessage);
    } else if (errorStatusCode == 401) {
      /// Unauthorized
      showErrorWidget(errorMessage: apiErrorMessage);
    } else if (errorStatusCode == 403) {
      /// Forbidden
      showErrorWidget(errorMessage: apiErrorMessage);
    } else if (errorStatusCode == 404) {
      /// Not found
      showErrorWidget(errorMessage: apiErrorMessage);
    } else if (errorStatusCode == 409) {
      /// Conflict with server
      showErrorWidget(errorMessage: apiErrorMessage);
    } else if (errorStatusCode == 500) {
      showErrorWidget(errorMessage: "Internal server error");
    } else {
      showErrorWidget(errorMessage: "Error in network");
    }
  }

  static void showErrorWidget({required String errorMessage}) {
    SnackBarComponent().showErrorSnackBar(errorText: errorMessage);
  }
}
