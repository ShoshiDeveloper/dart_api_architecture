import 'package:api_architecture/core/services/logger.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:supabase/supabase.dart';

Future<Response> errorHandler(Object e) async {
  Logger.instance.e(e);
  
  if(e is PostgrestException) {
    return Response.json(statusCode: 500, body: {
      "message": e.message,
      "code": e.code
    });
  }
  return Response.json(statusCode: 500, body: {
      "message": e.toString()
    });
}