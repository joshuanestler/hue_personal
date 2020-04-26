import 'package:huepersonal/api/bridgeClient.dart';
import 'package:huepersonal/models/sensor.dart';

class SensorAPI {
  BridgeClient _client;
  String _username;

  SensorAPI(this._client);

  set username(String username) => this._username;

  Future<Sensor> single(String id) {
    return null;
  }

  Future<List<Sensor>> all() {
    return null;
  }
}