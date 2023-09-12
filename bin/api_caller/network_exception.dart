import 'dart:convert';

class NetworkException implements Exception {
  final String? message;
  final String? _prefix;
  final ErrorMessage? _errorMessage;

  NetworkException([this.message, this._prefix, this._errorMessage]);

  String toString() {
    return '$_prefix$message';
  }

  static String getMessage(String message) {
    try {
      return json.decode(message)['message'];
    } catch (e) {
      return message;
    }
  }

  static String getErrorMessage(String errorMessage) {
    try {
      return errorMessage;
    } catch (e) {
      return e.toString();
    }
  }
}

class FetchDataException extends NetworkException {
  FetchDataException([String? message])
      : super(message, 'Error During Communication: ');
}

class BadRequestException extends NetworkException {
  BadRequestException([String? message]) : super(message, 'Invalid Request: ');
}

class UnauthorizedException extends NetworkException {
  UnauthorizedException([String? message]) : super(message, 'Unauthorised: ');
}

class InvalidInputException extends NetworkException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input: ');
}

class NotFoundException extends NetworkException {
  NotFoundException([String? message]) : super(message, 'Not found: ');
}

class RegisterFailedException extends NetworkException {
  RegisterFailedException([ErrorMessage? _errorMessage]) : super(_errorMessage!.message, 'Not found: ', _errorMessage);
}

class ErrorMessage {
  final String? message;
  final List<String>? errors;

  ErrorMessage({this.message, this.errors});

}