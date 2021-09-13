import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:hue_dart/hue_dart.dart';
import 'package:hue_personal/screens/BridgeDiscoveryScreen.dart';
import 'package:hue_personal/screens/groups/groupsOverviewScreen.dart';
import 'package:hue_personal/screens/lights/lightsOverviewScreen.dart';
import 'package:hue_personal/screens/rules/rulesOverviewScreen.dart';
import 'package:hue_personal/screens/rules/singleRuleOverviewScreen.dart';
import 'package:hue_personal/screens/scenes/scenesOverviewScreen.dart';
import 'package:hue_personal/screens/schedules/schedulesOverviewScreen.dart';
import 'package:hue_personal/screens/sensors/sensorsOverviewScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final Bridge bridge = Bridge(
      Client(), "192.168.188.12", "2Tzl7Yck4YksknR9OSBFHoCE3a1t3wTXS2sQRAGS");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hue Darter',
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          hintColor: Colors.grey),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: LightsOverviewScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case LightsOverviewScreen.routeName:
            return MaterialPageRoute(builder: (_) => LightsOverviewScreen());
          case GroupsOverviewScreen.routeName:
            return MaterialPageRoute(builder: (_) => GroupsOverviewScreen());
          case RulesOverviewScreen.routeName:
            return MaterialPageRoute(builder: (_) => RulesOverviewScreen());
          case SchedulesOverviewScreen.routeName:
            return MaterialPageRoute(builder: (_) => SchedulesOverviewScreen());
          case ScenesOverviewScreen.routeName:
            return MaterialPageRoute(builder: (_) => ScenesOverviewScreen());
          case SensorsOverviewScreen.routeName:
            return MaterialPageRoute(builder: (_) => SensorsOverviewScreen());
          case BridgeDiscoveryScreen.routeName:
            return MaterialPageRoute(builder: (_) => BridgeDiscoveryScreen());
          case SingleRuleOverviewScreen.routeName:
            return MaterialPageRoute(
                builder: (_) => SingleRuleOverviewScreen(settings.arguments as int?));
          default:
            throw Error();
        }
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
