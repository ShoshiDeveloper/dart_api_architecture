import 'package:api_architecture/repositories/user_repository.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async => await UserRepository().direct(context.request);
