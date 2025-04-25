import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'base_state.dart';

class BaseCubit extends Cubit<BaseState> {
  // final IRepository repository;
  // final PreferenceManager prefManager;
  // BaseCubit(super.initialState, this.repository, this.prefManager);
  BaseCubit(super.initialState);

  void emitSuccessState<T>(T data) {
    if (!isClosed) {
      emit(SuccessState<T>(data));
    }
  }

  void emitFailureState(String failureMsg) {
    if (!isClosed) {
      emit(FailureState(failureMsg));
    }
  }

  void showSnackBar(BuildContext context, String? error) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(error ?? "يرجي المحاولة لاحقاً")));
  }
}
