import 'package:flutter/material.dart';
import 'package:hue_dart/hue_dart.dart';
import 'package:hue_personal/widgets/mainDrawer.dart';
import 'package:hue_personal/widgets/scheduleListItem.dart';

import '../../main.dart';

class SchedulesOverviewScreen extends StatefulWidget {
  static const String routeName = "/schedules";

  @override
  _SchedulesOverviewScreenState createState() => _SchedulesOverviewScreenState();
}

class _SchedulesOverviewScreenState extends State<SchedulesOverviewScreen> {
  late List<Schedule> schedules;
  bool _isInit = true;
  bool _isLoading = true;

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      schedules = await MyApp.bridge.schedules().then((v) {
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
          title: Text("Schedules"),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView(children: schedules.map((e) => ScheduleListItem(e)).toList())
    );
  }
}
