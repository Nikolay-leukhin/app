class Failure {
  final String msg;

  Failure({required this.msg});

  @override
  String toString() {
    return "Failure : msg = $msg";
  }
}

class FailureMessage {
  static const NO_INTERNET_CONNECTION = "sorry you have not interner connection";

  static const UNHANDLED_ERROR = "SOME UNHENDLED ERROR";

  static const BAD_REQUEST = "BAD HTTTP REQUEST MA BAD BRO";
}
