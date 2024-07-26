import 'package:api_architecture/services/logger.dart';
import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return (request) async {
    Logger.request(request.request);
    return handler(request);
  };
}
