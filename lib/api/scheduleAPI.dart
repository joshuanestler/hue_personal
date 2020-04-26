import 'package:huepersonal/api/bridgeClient.dart';
import 'package:huepersonal/models/schedule.dart';

class ScheduleAPI {
  BridgeClient _client;
  String _username;

  ScheduleAPI(this._client);

  set username(String username) => this._username;

  Future<Schedule> single(String id) {
    return null;
  }

  Future<List<Schedule>> all() {
    return null;
  }
}