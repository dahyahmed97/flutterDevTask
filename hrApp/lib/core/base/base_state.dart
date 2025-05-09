import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {}

///The first state of the bloc
class InitialState extends BaseState {
  InitialState();

  @override
  List get props => [];
}
class FingerPrintState extends BaseState {
  final bool isFingerPrintEnabled;
  FingerPrintState(this.isFingerPrintEnabled);

  @override
  List get props => [];
}

///To indicate if there is a request was sent to the server or not
class PDFState<T> extends BaseState {
  final T? pdf;

  PDFState(
    this.pdf,
  );
  @override
  List<T> get props => pdf != null ? [pdf as T] : [];
}

///To indicate if there is a request was sent to the server or not
class LoadingState extends BaseState {
  @override
  List get props => [];
}

///Will represent the success which will be emitted to the bloc
class SuccessState<T> extends BaseState {
  final T? response;

  SuccessState(
    this.response,
  );
  @override
  List<T> get props => response != null ? [response as T] : [];
}

class PaymentSuccessState<T> extends BaseState {
  final T? response;

  PaymentSuccessState(
    this.response,
  );
  @override
  List<T> get props => response != null ? [response as T] : [];
}

///Will represent the failure which will be emitted to the bloc
class FailureState extends BaseState {
  final String? error;
  FailureState(
    this.error,
  );

  @override
  List<String> get props => error != null ? [error!] : [];
}

// class ErrorState extends BaseState {
//   final ErrorMessages? error;
//   ErrorState(
//     this.error,
//   );

//   @override
//   List<ErrorMessages> get props => error != null ? [error!] : [];
// }
