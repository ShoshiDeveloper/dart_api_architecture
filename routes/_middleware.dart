import 'package:api_architecture/core/services/logger.dart';
import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return Logger.instance.logRequest(handler);
}
