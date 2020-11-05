import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class InternetService {
  Connectivity connectivity;
  ConnectivityResult result;
  bool internetConnection;

  InternetService() {
    internetConnection = false;
    connectivity = Connectivity();
  }

  Future checkConnectivity() async {
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (error) {
      // print("err: ${error.toString()}");
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        internetConnection = true;
        // print("***$internetConnection");
        break;
      case ConnectivityResult.none:
        internetConnection = false;
        // print("***$internetConnection");
        break;
    }
  }

  getConnection() {
    return internetConnection;
  }
}
