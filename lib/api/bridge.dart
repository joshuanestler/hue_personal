import 'package:http/http.dart';
import 'package:huepersonal/api/bridgeClient.dart';
import 'package:huepersonal/api/configurationAPI.dart';
import 'package:huepersonal/api/lightAPI.dart';
import 'package:huepersonal/api/resourceLinkAPI.dart';
import 'package:huepersonal/api/ruleAPI.dart';
import 'package:huepersonal/api/sceneAPI.dart';
import 'package:huepersonal/api/scheduleAPI.dart';
import 'package:huepersonal/api/sensorAPI.dart';
import 'package:huepersonal/models/rule.dart';
import 'package:huepersonal/models/group.dart';
import 'package:huepersonal/models/scene.dart';
import 'package:huepersonal/models/schedule.dart';
import 'package:huepersonal/models/sensor.dart';

import '../models/light.dart';
import 'groupAPI.dart';

class Bridge {
  final ConfigurationAPI _configurationApi;
  final GroupAPI _groupApi;
  final LightAPI _lightApi;
  final ResourceLinkAPI _resourceLinkApi;
  final RuleAPI _ruleApi;
  final SceneAPI _sceneApi;
  final ScheduleAPI _scheduleApi;
  final SensorAPI _sensorApi;

  String _username;

  /// create a bridge with a platform specific [client]. Setting the optional [username] enables the use of calls on the bridge that require a username
  Bridge(Client client, String address, [String username])
      : this._withApi(
      ConfigurationAPI(BridgeClient(client, address)),
      GroupAPI(BridgeClient(client, address)),
      LightAPI(BridgeClient(client, address)),
      ResourceLinkAPI(BridgeClient(client, address)),
      RuleAPI(BridgeClient(client, address)),
      SceneAPI(BridgeClient(client, address)),
      ScheduleAPI(BridgeClient(client, address)),
      SensorAPI(BridgeClient(client, address)),
      username);

  Bridge._withApi(this._configurationApi,
      this._groupApi,
      this._lightApi,
      this._resourceLinkApi,
      this._ruleApi,
      this._sceneApi,
      this._scheduleApi,
      this._sensorApi,
      [String username]) {
    this.username = username;
  }

  /// set a username to enable the use of cclls on the bridge that require a username
  set username(String username) {
    this._username = username;
    _groupApi.username = username;
    _lightApi.username = username;
    _resourceLinkApi.username = username;
    _ruleApi.username = username;
    _sceneApi.username = username;
    _scheduleApi.username = username;
    _sensorApi.username = username;
  }

  Future<List<Group>> groups() async => await _groupApi.all();

  Future<Group> group(int id) async => await _groupApi.single(id);

  //Future<Group> createGroup(Group group) async => await _groupApi.create(group);

  /// LIGHTS

  Future<List<Light>> lights() async => await _lightApi.all();

  Future<Light> light(int id) async => await _lightApi.single(id);

  void toggleLight(int id, bool on) => _lightApi.toggleLight(id, on);

  /// return the lights found in the last search for new lights
  /*
  Future<List<Light>> lightSearchResults() async =>
      await _lightApi.searchResults();
*/

  /// RULES
  Future<List<Rule>> rules() async => await _ruleApi.all();

  Future<Rule> rule(int id) async => await _ruleApi.single(id);

  //Future<Rule> createRule(Rule rule) async => await _ruleApi.create(rule);

  Future<List<Scene>> scenes() async => await _sceneApi.all();

  Future<Scene> scene(String id) async => await _sceneApi.single(id);

  //Future<Scene> createScene(Scene scene) async => await _sceneApi.create(scene);

  Future<List<Schedule>> schedules() async => await _scheduleApi.all();

  Future<Schedule> schedule(String id) async => await _scheduleApi.single(id);

  //Future<Schedule> createSchedule(Schedule schedule) async =>
  //    await _scheduleApi.create(schedule);

  Future<List<Sensor>> sensors() async => await _sensorApi.all();

  Future<Sensor> sensor(String id) async => await _sensorApi.single(id);

  //Future<List<Sensor>> sensorSearchResults() async =>
  //    await _sensorApi.searchResults();

  //Future<Sensor> createSensor(Sensor sensor) async =>
  //    await _sensorApi.create(sensor);

}