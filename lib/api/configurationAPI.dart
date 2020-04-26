import 'package:huepersonal/api/bridgeClient.dart';

class ConfigurationAPI {
  BridgeClient _client;
  String _username;

  ConfigurationAPI(this._client);

  set username(String username) => this._username;
}