// ignore_for_file: avoid_print

import 'dart:io';

import '../errors/exceptions.dart';
import 'api_const.dart';

abstract class INetworkInfo {
  Future<bool> get isConnected;
}

class InternetAddressLookup {
  Future<List<InternetAddress>> lookup() =>
      InternetAddress.lookup(ApiConsts.connectionDataCheckerAddress);
}

class NetworkInfo implements INetworkInfo {
  InternetAddressLookup internetAddressLookup;
  NetworkInfo(this.internetAddressLookup);

  @override
  Future<bool> get isConnected async {
    try {
      final result = await internetAddressLookup.lookup();
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        throw NetworkInfoException();
      }
    } catch (e) {
      throw NetworkInfoException();
    }
  }
}
