import 'package:flutter/material.dart';
import 'package:hue_dart/hue_dart.dart';
import 'package:huepersonal/widgets/mainDrawer.dart';

import '../../main.dart';

class ScenesOverviewScreen extends StatefulWidget {
  static const String routeName = "/scenes";

  @override
  _ScenesOverviewScreenState createState() => _ScenesOverviewScreenState();
}

class _ScenesOverviewScreenState extends State<ScenesOverviewScreen> {
  List<Scene> scenes;
  bool _isInit = true;
  bool _isLoading = true;

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      scenes = await MyApp.bridge.scenes().then((v) {
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
      appBar: AppBar(
        title: Text("Scenes"),
      ),
      drawer: MainDrawer(),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: scenes
                  .map((e) => ListTile(
                        title: Text(e.name),
                      ))
                  .toList()),
    );
  }
}
