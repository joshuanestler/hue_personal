import 'package:huepersonal/api/bridgeClient.dart';

class ResourceLinkAPI {
  BridgeClient _client;
  String _username;

  ResourceLinkAPI(this._client);

  set username(String username) => this._username;
}