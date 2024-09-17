import 'package:api_architecture/exceptions/wrong_json_exception.dart';
import 'package:supabase/supabase.dart';

/**
 * U - User
 * S - Server
 * SP - Postgress
 * CJ - client json
 */

enum ErrorCodes {
  badRequest(httpCode: 400, code: 'U0', message: 'Bad request'),
  unauthorized(httpCode: 401, code: 'U1', message: 'Unauthorized'),
  accessDenied(httpCode: 403, code: 'U3', message: 'Access denied'),

  undefiend(httpCode: 500, code: 'S0', message: 'Something went wrong'),
  notImplemented(httpCode: 501, code: 'S1', message: 'Not implemented'),
  unvailable(httpCode: 503, code: 'S3', message: 'The service is temporarily unavailable'),
  
  postgress(httpCode: 500, code: 'SP1', message: ''),
  wrongJson(httpCode: 500, code: 'CJ1', message: 'Received wrong json');

  const ErrorCodes({required this.httpCode, required this.code, required this.message});

  final int httpCode;
  final String code;
  final String message;

  static ErrorCodes fromException(Exception exception) {
    return switch (exception) {
      PostgrestException() => ErrorCodes.postgress,
      WrongJsonException() => ErrorCodes.wrongJson,
      WrongBearerTokenException() => ErrorCodes.accessDenied,
      _ => ErrorCodes.undefiend
    };
  }
}