import 'dart:convert';
import 'package:http/http.dart' as http;

class ExceptionHandler implements Exception {
  final String message;
  final String prefix;
  ExceptionHandler(this.message, this.prefix);
  @override
  String toString() {
    return "$prefix, $message";
  }
}

// -------BadRequestException - Error Code 400--------
class BadRequestException extends ExceptionHandler {
  BadRequestException(String msg) : super(msg, "Error! Bad Request");
}

// -------UnauthorizedException - Error Code 401--------
class UnauthorizedException extends ExceptionHandler {
  UnauthorizedException(String msg) : super(msg, "Error! Unauthorized");
}

// -------ForbiddenException - Error Code 403--------
class ForbiddenException extends ExceptionHandler {
  ForbiddenException(String msg) : super(msg, "Error! Forbidden");
}

// -------NointernetException - Error Code 500--------
class NointernetException extends ExceptionHandler {
  NointernetException(String msg) : super(msg, "Error! No Internet");
}

generateResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var db = jsonDecode(response.body);
      return db;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
      throw UnauthorizedException(response.body.toString());
    case 403:
      throw ForbiddenException(response.body.toString());
    default:
      throw "Technical Error";
  }
}
