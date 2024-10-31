import 'package:api_architecture/core/services/logger.dart';
import 'package:api_architecture/core/utils/error_code.dart';
import 'package:dart_frog/dart_frog.dart';

extension ExceptionExtension on Exception {
  Response get response {
    Logger.instance.e(this);
    final errorCode = ErrorCodes.fromException(this);
    return errorCode.response;
  }
}