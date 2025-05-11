import 'package:dio/dio.dart';
import 'package:finance/error/exceptions.dart';
import 'package:finance/src/helper/helper.dart';
import 'package:finance/src/service/log_service.dart';
import 'package:flutter/material.dart';

enum ToastType { warning, error, success, info }

class UiService {
  static void handleUIError(BuildContext context, {required dynamic error}) {
    if (error is DioException) {
      if (error.error is UserException) {
        String errorString =
            Helper.getErrorMessage((error.error as UserException).error);

        LogService.logDebug(errorString);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorString),
            duration: Duration(seconds: 2),
          ),
        );
      } else if (error.error is UnknownException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("An error occurred! Please try again."),
            duration: Duration(seconds: 2),
          ),
        );
      } else if (error.error is ConnectionException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Poor connection. Please connect to the internet."),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("An error occurred! Please try again."),
            duration: Duration(seconds: 2),
          ),
        );
    }
  }
}
