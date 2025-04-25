// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  String message;
  Failure(this.message);
  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

class UnAuthorizedFailure extends Failure {
  UnAuthorizedFailure(super.message);
}

class GeneralFailure extends Failure {
  GeneralFailure(super.message);
}

class OnboardOpenedFailure extends Failure {
  OnboardOpenedFailure(super.message);
}

class NotFoundFailure extends Failure {
  NotFoundFailure(super.message);
}

class ValidationFailure extends Failure {
  ValidationFailure(super.message);
}

class NotCachedFailure extends Failure {
  NotCachedFailure(super.message);
}

class ConflictFailure extends Failure {
  ConflictFailure(super.message);
}

class RequestTimeoutFailure extends Failure {
  RequestTimeoutFailure(super.message);
}

class UnProcessableEntityFailure extends Failure {
  UnProcessableEntityFailure(super.message);
}

class InternalServerErrorFailure extends Failure {
  InternalServerErrorFailure(super.message);
}

class ServiceUnavailableFailure extends Failure {
  ServiceUnavailableFailure(super.message);
}

class UnexpectedErrorFailure extends Failure {
  UnexpectedErrorFailure(super.message);
}
