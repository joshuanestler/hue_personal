import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class LocaleBase {
  Map<String, dynamic> _data;
  String _path;
  Future<void> load(String path) async {
    _path = path;
    final strJson = await rootBundle.loadString(path);
    _data = jsonDecode(strJson);
    initAll();
  }

  Map<String, String> getData(String group) {
    return Map<String, String>.from(_data[group]);
  }

  String getPath() => _path;

  LocalebridgeDiscovery _bridge_discovery;
  LocalebridgeDiscovery get bridge_discovery => _bridge_discovery;

  void initAll() {
    _bridge_discovery = LocalebridgeDiscovery(
        Map<String, String>.from(_data['bridge_discovery']));
  }
}

class LocalebridgeDiscovery {
  final Map<String, String> _data;
  LocalebridgeDiscovery(this._data);

  String get automaticSearch => _data["automatic_search"];
  String get heading => _data["heading"];
  String get searchIp => _data["search_ip"];
}
