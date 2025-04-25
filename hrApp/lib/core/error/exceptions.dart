class ServerException implements Exception {
  final String msg;
  const ServerException(this.msg);

  @override
  String toString() {
    return msg;
  }
}

class UnAuthorizedException implements Exception {}

class UpgradeRequiredException implements Exception {}

class OnboardOpenedException implements Exception {}

class NetworkException implements Exception {}

class NotFoundException implements Exception{
  final Map<String,dynamic> responseData;
  const NotFoundException(this.responseData);
}

class NetworkExceptionV implements Exception {
  final Map<String,dynamic> responseData;
  const NetworkExceptionV(this.responseData);
}

class ValidationException implements Exception {
  final Map<String,dynamic> responseData;
  const ValidationException(this.responseData);
}

class NotCachedException implements Exception {
  final Map<String,dynamic> responseData;
  const NotCachedException(this.responseData);
}

class ConflictException implements Exception {
  final Map<String,dynamic> responseData;
  const ConflictException(this.responseData);
}

class RequestTimeout implements Exception {
  final Map<String,dynamic> responseData;
  const RequestTimeout(this.responseData);
}

class UnProcessableEntity implements Exception {
  final Map<String,dynamic> responseData;
  const UnProcessableEntity(this.responseData);
}

class InternalServerError implements Exception {
  final Map<String,dynamic> responseData;
  const InternalServerError(this.responseData);
}

class ServiceUnavailable implements Exception {
  final Map<String,dynamic> responseData;
  const ServiceUnavailable(this.responseData);
}

class UnexpectedError implements Exception {

}

class GeneralException implements Exception {
  final String msg;
  const GeneralException(this.msg);

  @override
  String toString() {
    return msg;
  }
}

