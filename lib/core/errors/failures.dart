abstract class Failures {
  String errorMessage;

  Failures({required this.errorMessage});
}

class ServerError extends Failures {
  ServerError({required super.errorMessage});
}

class NetworkError extends Failures {
  NetworkError({required super.errorMessage});
}

class UserError extends Failures {
  UserError({required super.errorMessage});
}

class ServerFailure extends Failures {
  ServerFailure(String message) : super(errorMessage: message);
}
