import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutterdevtask/core/helpers/utils/snack_bar_helper.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  List<ConnectivityResult> _lastResults = [];

  void initialize() {
    _subscription = _connectivity.onConnectivityChanged.listen((results) {
      if (!_areConnectivityResultsEqual(_lastResults, results)) {
        _handleChange(results);
      }

      _lastResults = results;
    });
  }

  bool _areConnectivityResultsEqual(
    List<ConnectivityResult> a,
    List<ConnectivityResult> b,
  ) {
    if (a.isEmpty) return true;
    return Set.of(a).containsAll(b) && Set.of(b).containsAll(a);
  }

  void _handleChange(List<ConnectivityResult> results) {
    final bool isConnected =
        results.isNotEmpty &&
        results.any((result) => result != ConnectivityResult.none);

    final String message =
        isConnected ? _getConnectionType(results) : "No Internet Connection";

    showGlobalSnackBar(message);
  }

  String _getConnectionType(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.wifi) ||
        results.contains(ConnectivityResult.mobile)) {
      return "Internet Connection Available";
    }

    return 'Connected';
  }

  void dispose() => _subscription?.cancel();
}
