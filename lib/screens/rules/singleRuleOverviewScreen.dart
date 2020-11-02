import 'package:flutter/material.dart';
import 'package:hue_dart/hue_dart.dart';
import 'package:huepersonal/main.dart';
import 'package:huepersonal/widgets/rules/ruleActionOverviewItem.dart';
import 'package:huepersonal/widgets/rules/ruleConditionOverviewItem.dart';

class SingleRuleOverviewScreen extends StatefulWidget {
  static const String routeName = "/singleRuleOverview";

  final int _id;
  SingleRuleOverviewScreen(this._id);

  @override
  _SingleRuleOverviewScreenState createState() =>
      _SingleRuleOverviewScreenState();
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
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: Text(_rule.name),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            const Text("Name"),
                            const SizedBox(width: 20),
                            Container(
                              width: 300,
                              height: 50,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: _rule.name,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text("Active"),
                            Switch(
                              value: _rule.status == "enabled",
                              onChanged: (v) {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const SizedBox(),
                      _titleText("Conditions"),
                      IconButton(icon: const Icon(Icons.add), onPressed: () {})
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: _rule.conditions
                          .map((e) => RuleConditionOverviewItem(e))
                          .toList(),
                    ),
                  ),
                  const Divider(thickness: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const SizedBox(),
                      _titleText("Actions"),
                      IconButton(icon: const Icon(Icons.add), onPressed: () {})
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: _rule.actions
                          .map((e) => RuleActionOverviewItem(e))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  static Widget _titleText(String text) {
    return Container(
      height: 40,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              fontSize: 16,
              decorationStyle: TextDecorationStyle.solid),
        ),
      ),
    );
  }
}
