import 'package:dart_frog/dart_frog.dart';

abstract class IRepository {
  Future<Response> direct(Request request) async => switch(request.method) {
    HttpMethod.get => get(),
    HttpMethod.post => post(),
    HttpMethod.put => put(),
    HttpMethod.delete => delete(),
    HttpMethod.head => head(),
    HttpMethod.options => options(),
    HttpMethod.patch => patch()
  };

  Future<Response> get() async => Response(statusCode: 501, body: 'Not implemented');
  Future<Response> post() async => Response(statusCode: 501, body: 'Not implemented');
  Future<Response> put() async => Response(statusCode: 501, body: 'Not implemented');
  Future<Response> delete() async => Response(statusCode: 501, body: 'Not implemented');
  Future<Response> head() async => Response(statusCode: 501, body: 'Not implemented');
  Future<Response> options() async => Response(statusCode: 501, body: 'Not implemented');
  Future<Response> patch() async => Response(statusCode: 501, body: 'Not implemented');


}