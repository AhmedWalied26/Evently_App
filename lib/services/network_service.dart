import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService {
  static final Connectivity _connectivity = Connectivity();

  static Stream<List<ConnectivityResult>> get onConnectionChanged =>
      _connectivity.onConnectivityChanged;
}
