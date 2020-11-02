import 'package:flutter/material.dart';
import 'package:hue_dart/hue_dart.dart';
import 'package:huepersonal/main.dart';

class SingleRuleOverviewScreen extends StatefulWidget {
  static const String routeName = "/singleRuleOverview";

  int _id;
  SingleRuleOverviewScreen(this._id);

  @override
  _SingleRuleOverviewScreenState createState() => _SingleRuleOverviewScreenState();
}

class _SingleRuleOverviewScreenState extends State<SingleRuleOverviewScreen> {

  Rule _rule;
  bool _isLoading = true;

  @override
  void didChangeDependencies() async {
    await MyApp.bridge.rule(widget._id).then((r) {
      setState(() {
        _rule = r;
        _isLoading = false;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? CircularProgressIndicator() : Scaffold(
      appBar: AppBar(
        title: Text(_rule.name),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
                hintText: _rule.name,
              ),
            ),
          )
        ],
      ),
    );
  }
}
