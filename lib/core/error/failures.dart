abstract class Failure {
  const Failure() : super();
}

// General failures
class ServerFailure extends Failure {
  final String? message;
  final Map<String, dynamic>? data;

  const ServerFailure({
    this.message,
    this.data,
  });
}

class CacheFailure extends Failure {}
