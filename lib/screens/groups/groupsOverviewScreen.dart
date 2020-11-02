import 'package:flutter/material.dart';
import 'package:hue_dart/hue_dart.dart';
import 'package:huepersonal/widgets/groupListItem.dart';
import 'package:huepersonal/widgets/mainDrawer.dart';

import '../../main.dart';

class GroupsOverviewScreen extends StatefulWidget {
  static const String routeName = "/groups";

  @override
  _GroupsOverviewScreenState createState() => _GroupsOverviewScreenState();
}

class _GroupsOverviewScreenState extends State<GroupsOverviewScreen> {
  List<Group> groups;
  bool _isInit = true;
  bool _isLoading = true;

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      groups = await MyApp.bridge.groups().then((v) {
        print("Groups returned");
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
          title: const Text("Groups"),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView(children: groups.map((e) => GroupListItem(e)).toList()));
  }
}
