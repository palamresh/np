class AppException implements Exception {
  final _message;
  final _prifix;
  AppException([this._message, this._prifix]);
  @override
  String toString() {
    return "$_message$_prifix";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication");
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Invalid Request");
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message])
      : super(message, "Unauthorized Exception");
}

class InvailedInputException extends AppException {
  InvailedInputException([String? message])
      : super(message, "Invalid Input Exception");
}
