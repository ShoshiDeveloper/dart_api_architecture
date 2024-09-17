class WrongJsonException implements Exception {
@override
  String toString() {
    return 'Wrong JSON Exception';
  }
}

class WrongBearerTokenException implements Exception {
@override
  String toString() {
    return 'Wrong bearer token';
  }
}