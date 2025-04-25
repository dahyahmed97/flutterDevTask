import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/locale_cubit.dart';

// class BlocProviders2 {

//   static final List<BlocProvider> providers = [
//     BlocProvider<LocaleCubit>(create: (_) => LocaleCubit()),

//   ];
// }

class BlocProviders {
  static Future<List<BlocProvider>> providers() async {
    final localeCubit = await LocaleCubit.create();
    return [
      BlocProvider<LocaleCubit>(create: (_) => localeCubit),
      // Add other BlocProviders here...
    ];
  }
}
