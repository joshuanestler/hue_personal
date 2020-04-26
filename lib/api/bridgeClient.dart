import 'dart:convert';

import 'package:http/http.dart';

class BridgeClient {
  Client _client;
  String _address;

  BridgeClient(Client client, String address) {
    this._client = client;
    this._address = "http://$address";
  }

  Future<Map<String, dynamic>> get(String url) async {
    final response = await _client.get("$_address$url");
    Map responseMap = json.decode(response.body);
    _checkException(responseMap);
    return responseMap;
  }

  _checkException(dynamic response) {
    if (response is List) {
      Map<String, dynamic> resultMap = response.first;
      if (resultMap.containsKey('error')) {
        throw Error();
      }
    }
  }

  Future<Map<String, dynamic>> put(String url, dynamic body) async {
    final response = await _client.put("$_address$url", body: json.encode(body));
    var responseMap = json.decode(response.body);
    _checkException(responseMap);
    return responseMap;
  }
}