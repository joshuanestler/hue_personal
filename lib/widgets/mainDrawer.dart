import 'package:flutter/material.dart';
import 'package:hue_personal/main.dart';
import 'package:hue_personal/screens/BridgeDiscoveryScreen.dart';
import 'package:hue_personal/screens/groups/groupsOverviewScreen.dart';
import 'package:hue_personal/screens/lights/lightsOverviewScreen.dart';
import 'package:hue_personal/screens/rules/rulesOverviewScreen.dart';
import 'package:hue_personal/screens/scenes/scenesOverviewScreen.dart';
import 'package:hue_personal/screens/schedules/schedulesOverviewScreen.dart';
import 'package:hue_personal/screens/sensors/sensorsOverviewScreen.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  String? _name;
  String? _ip;
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
                  accountName: Text('$_name'),
                  accountEmail: Text('$_ip'),
                  currentAccountPicture:
                      Image.asset("assets/images/hue-bridge.png"),
                ),
                ListTile(
                  title: const Text("Lights"),
                  onTap: () => Navigator.pushReplacementNamed(
                      context, LightsOverviewScreen.routeName),
                ),
                ListTile(
                  title: const Text("Groups"),
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
                ListTile(
                  title: const Text("Bridge Discovery"),
                  onTap: () => Navigator.pushNamed(
                      context, BridgeDiscoveryScreen.routeName),
                ),
              ],
            ),
    );
  }
}
