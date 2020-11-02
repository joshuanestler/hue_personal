import 'package:flutter/material.dart';
import 'package:hue_dart/hue_dart.dart';
import 'package:huepersonal/widgets/mainDrawer.dart';

import 'file:///E:/Projects/Android/hue_personal/lib/widgets/rules/ruleListItem.dart';

import '../../main.dart';

class RulesOverviewScreen extends StatefulWidget {
  static const String routeName = "/rules";

  @override
  _RulesOverviewScreenState createState() => _RulesOverviewScreenState();
}

class _RulesOverviewScreenState extends State<RulesOverviewScreen> {
  List<Rule> rules;
  bool _isInit = true;
  bool _isLoading = true;

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      rules = await MyApp.bridge.rules().then((v) {
        print("Rules returned");
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
          title: const Text("Rules"),
          actions: <Widget>[
            IconButton(icon: const Icon(Icons.add), onPressed: () {})
          ],
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView(children: rules.map((e) => RuleListItem(e)).toList()));
  }
}
