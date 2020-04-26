import 'package:huepersonal/api/bridgeClient.dart';
import 'package:huepersonal/models/scene.dart';

class SceneAPI {
  BridgeClient _client;
  String _username;

  SceneAPI(this._client);

  set username(String username) => this._username;

  Future<Scene> single(String id) {
    return null;
  }

  Future<List<Scene>> all() {
    return null;
  }
}