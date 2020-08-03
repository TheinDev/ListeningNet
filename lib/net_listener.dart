

import 'dart:async';

import 'package:connectivity/connectivity.dart';

import 'net_constant.dart';

class NetListener {
  StreamController<NetConstant> netStream
  = StreamController<NetConstant>();


  NetListener(){


    Connectivity().onConnectivityChanged.listen((ConnectivityResult result)
    {

      netStream.add(getNetStatus(result));


    }

    );
  }

  NetConstant getNetStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return NetConstant.Lte;
      case ConnectivityResult.wifi:
        return NetConstant.Wifi;
      case ConnectivityResult.none:
        return NetConstant.Offline;
      default:
        return NetConstant.Offline;
    }
  }
}