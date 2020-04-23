import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:huepersonal/models/light.dart';
import 'package:http/http.dart' as http;

class LightList with ChangeNotifier {
  List<Light> lights = [];

  LightList() {
    //updateList();
  }

  Future<void> updateList() async {
    http.get("http://192.168.178.12/api/lights").then((value) {
      print(json.decode(value.body).toString());
    });
  }
}