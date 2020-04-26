import 'package:flutter/material.dart';
import 'package:hue_dart/hue_dart.dart';
import 'package:huepersonal/widgets/mainDrawer.dart';
import 'package:huepersonal/widgets/sensorListItem.dart';

import '../../main.dart';

class SensorsOverviewScreen extends StatefulWidget {
  static const String routeName = "/sensors";

  @override
  _SensorsOverviewScreenState createState() => _SensorsOverviewScreenState();
}

class _SensorsOverviewScreenState extends State<SensorsOverviewScreen> {
  List<Sensor> sensors;
  bool _isInit = true;
  bool _isLoading = true;

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      sensors = await MyApp.bridge.sensors().then((v) {
        setState(() {
          _isLoading = false;
        });
        return v;
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text("Sensors"),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView(children: sensors.map((e) => SensorListItem(e)).toList())
    );
  }
}
