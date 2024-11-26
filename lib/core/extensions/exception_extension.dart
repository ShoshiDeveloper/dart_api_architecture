import 'package:api_architecture/core/services/logger.dart';
import 'package:api_architecture/core/utils/error_code.dart';
import 'package:api_architecture/exceptions/repository_exception.dart';
import 'package:dart_frog/dart_frog.dart';

extension ExceptionExtension on Exception {
  Response getRresponseWithTrace(StackTrace st) {
    Logger.instance.e(this, st: st);
    if (this is RepositoryException) {
      return (this as RepositoryException).errorCode.response;
    }

    final errorCode = ErrorCodes.byException(this);
    return errorCode.response;
  }

  Response get response {
    Logger.instance.e(this);
    if (this is RepositoryException) {
      return (this as RepositoryException).errorCode.response;
    }

    final errorCode = ErrorCodes.byException(this);
    return errorCode.response;
  }
}
