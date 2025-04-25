import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabCubit extends Cubit<int> {
  HomeTabCubit() : super(0); // Default to first tab

  void changeTab(int index) => emit(index);
}
