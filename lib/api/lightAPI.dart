import 'package:huepersonal/api/bridgeClient.dart';
import 'package:huepersonal/models/light.dart';

class LightAPI {

  BridgeClient _client;
  String _username;

  LightAPI(this._client);

  Future<Light> single(int id) async {
    final response = await _client.get("/api/$_username/lights/$id");
    return Light.fromJSON(response);
  }

  Future<List<Light>> all() {
    return null;
  }

  void toggleLight(int id, bool on) async {
    Map<String, dynamic> body = {"on":on};
    final response = await _client.put("/api/$_username/lights/$id/state", body);
  }

  set username(String username) => this._username;
}