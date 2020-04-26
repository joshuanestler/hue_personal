import 'package:huepersonal/api/bridgeClient.dart';
import 'package:huepersonal/models/group.dart';

class GroupAPI {
  BridgeClient _client;
  String _username;

  GroupAPI(this._client);

  set username(String username) => this._username;

  Future<Group> single(int id) {
    return null;
  }

  Future<List<Group>> all() {
    return null;
  }
}