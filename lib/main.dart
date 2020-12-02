import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:hue_dart/hue_dart.dart';
import 'package:huepersonal/screens/BridgeDiscoveryScreen.dart';
import 'package:huepersonal/screens/groups/groupsOverviewScreen.dart';
import 'package:huepersonal/screens/lights/lightsOverviewScreen.dart';
import 'package:huepersonal/screens/rules/rulesOverviewScreen.dart';
import 'package:huepersonal/screens/rules/singleRuleOverviewScreen.dart';
import 'package:huepersonal/screens/scenes/scenesOverviewScreen.dart';
import 'package:huepersonal/screens/schedules/SchedulesOverviewScreen.dart';
import 'package:huepersonal/screens/sensors/sensorsOvervieScreen.dart';

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
          case SingleRuleOverviewScreen.routeName:
            return MaterialPageRoute(
                builder: (_) => SingleRuleOverviewScreen(settings.arguments));
          default:
            throw Error();
        }
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
