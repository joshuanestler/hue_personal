import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:huepersonal/screens/schedules/SchedulesOverviewScreen.dart';
import 'package:huepersonal/screens/lights/lightsOverviewScreen.dart';
import 'package:huepersonal/screens/groups/groupsOverviewScreen.dart';
import 'package:huepersonal/screens/rules/rulesOverviewScreen.dart';
import 'package:huepersonal/screens/sensors/sensorsOverviewScreen.dart';

import 'api/bridge.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String username = "2Tzl7Yck4YksknR9OSBFHoCE3a1t3wTXS2sQRAGS";
  static final Bridge bridge = Bridge(Client(), "192.168.178.12", username);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color.fromRGBO(30, 30, 30, 1),
        cardColor: Color.fromRGBO(50, 50, 50, 1),
      ),
      home: LightsOverviewScreen(),
      routes: {
        LightsOverviewScreen.routeName: (_) => LightsOverviewScreen(),
        GroupsOverviewScreen.routeName: (_) => GroupsOverviewScreen(),
        RulesOverviewScreen.routeName: (_) => RulesOverviewScreen(),
        SchedulesOverviewScreen.routeName: (_) => SchedulesOverviewScreen(),
        SensorsOverviewScreen.routeName: (_) => SensorsOverviewScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello"),
        ),
        body: Center(
          child: Text("Hi"),
        ));
  }
}
