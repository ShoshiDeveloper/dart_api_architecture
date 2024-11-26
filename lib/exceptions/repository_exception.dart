import 'package:api_architecture/core/enums/error_code.dart';

class RepositoryException implements Exception {
  const RepositoryException(this.errorCode);

  final ErrorCodes errorCode;

  @override
  String toString() => 'HttpCode: ${errorCode.httpCode} Code: ${errorCode.code} Message: ${errorCode.message}';
}
