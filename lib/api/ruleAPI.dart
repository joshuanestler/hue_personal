import 'package:huepersonal/api/bridgeClient.dart';
import 'package:huepersonal/models/rule.dart';

class RuleAPI {
  BridgeClient _client;
  String _username;

  RuleAPI(this._client);

  set username(String username) => this._username;

  Future<Rule> single(int id) {
    return null;
  }

  Future<List<Rule>> all() {
    return null;
  }
}