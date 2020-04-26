import 'package:flutter/material.dart';
import 'package:huepersonal/screens/schedules/SchedulesOverviewScreen.dart';
import 'package:huepersonal/screens/lights/lightsOverviewScreen.dart';
import 'package:huepersonal/screens/groups/groupsOverviewScreen.dart';
import 'package:huepersonal/screens/rules/rulesOverviewScreen.dart';
import 'package:huepersonal/screens/sensors/sensorsOvervieScreen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(child: Container(color: Colors.black,)),
          ListTile(
            title: Text("Lights"),
            onTap: () => Navigator.pushReplacementNamed(context, LightsOverviewScreen.routeName),
          ),
          ListTile(
            title: Text("Rooms"),
            onTap: () => Navigator.pushReplacementNamed(context, GroupsOverviewScreen.routeName),
          ),
          ListTile(
            title: Text("Rules"),
            onTap: () => Navigator.pushReplacementNamed(context, RulesOverviewScreen.routeName),
          ),
          ListTile(
            title: Text("Scenes"),
            onTap: () => Navigator.pushReplacementNamed(context, SchedulesOverviewScreen.routeName),
          ),
          ListTile(
            title: Text("Schedules"),
            onTap: () => Navigator.pushReplacementNamed(context, SchedulesOverviewScreen.routeName),
          ),
          ListTile(
            title: Text("Sensors"),
            onTap: () => Navigator.pushReplacementNamed(context, SensorsOverviewScreen.routeName),
          ),
        ],
      ),
    );
  }
}
