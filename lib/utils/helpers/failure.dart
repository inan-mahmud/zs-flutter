class Failure {
  final String message;
  final int code;

  Failure(this.message, this.code);

  @override
  String toString() => "$code - $message";
}

throwFailure(e) {
  switch (e) {
    case 401:
      throw Failure("These credentials do not match our records.", 401);
    case 422:
      throw Failure("Invalid Input", 422);
    case 500:
      throw Failure("Internal Server Error", 500);
    case 404:
      throw Failure("Not Found", 404);
    case 400:
      throw Failure("Bad Request", 400);
    default:
      throw Failure("Request Timeout", 408);
  }
}
