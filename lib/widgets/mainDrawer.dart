import 'package:flutter/material.dart';
import 'package:huepersonal/main.dart';
import 'package:huepersonal/screens/groups/groupsOverviewScreen.dart';
import 'package:huepersonal/screens/lights/lightsOverviewScreen.dart';
import 'package:huepersonal/screens/rules/rulesOverviewScreen.dart';
import 'package:huepersonal/screens/scenes/scenesOverviewScreen.dart';
import 'package:huepersonal/screens/schedules/SchedulesOverviewScreen.dart';
import 'package:huepersonal/screens/sensors/sensorsOvervieScreen.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  String _name;
  String _ip;
  bool _isLoading = true;

  @override
  void didChangeDependencies() async {
    await MyApp.bridge.configuration().then((v) {
      setState(() {
        _isLoading = false;
        _name = v.name;
        _ip = v.ipAddress;
      });
      return;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(_name),
                  accountEmail: Text("$_ip"),
                  currentAccountPicture:
                      Image.asset("assets/images/hue-bridge.png"),
                ),
                ListTile(
                  title: const Text("Lights"),
                  onTap: () => Navigator.pushReplacementNamed(
                      context, LightsOverviewScreen.routeName),
                ),
                ListTile(
                  title: const Text("Rooms"),
                  onTap: () => Navigator.pushReplacementNamed(
                      context, GroupsOverviewScreen.routeName),
                ),
                ListTile(
                  title: const Text("Rules"),
                  onTap: () => Navigator.pushReplacementNamed(
                      context, RulesOverviewScreen.routeName),
                ),
                ListTile(
                  title: const Text("Scenes"),
                  onTap: () => Navigator.pushReplacementNamed(
                      context, ScenesOverviewScreen.routeName),
                ),
                ListTile(
                  title: const Text("Schedules"),
                  onTap: () => Navigator.pushReplacementNamed(
                      context, SchedulesOverviewScreen.routeName),
                ),
                ListTile(
                  title: const Text("Sensors"),
                  onTap: () => Navigator.pushReplacementNamed(
                      context, SensorsOverviewScreen.routeName),
                ),
              ],
            ),
    );
  }
}
