import 'package:api_architecture/repositories/cars_repository.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async => await CarsRepository().direct(context.request);
