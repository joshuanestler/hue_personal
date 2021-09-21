import 'package:flutter/material.dart';
import 'package:hue_dart/hue_dart.dart';
import 'package:hue_personal/screens/rules/singleRuleOverviewScreen.dart';

class RuleListItem extends StatefulWidget {
  final Rule reference;
  RuleListItem(this.reference);

  @override
  _RuleListItemState createState() => _RuleListItemState();
}

class _RuleListItemState extends State<RuleListItem> {
  String? _status;
  late List<Condition> _conditions;
  late List<RuleAction> _actions;

  @override
  void initState() {
    _status = widget.reference.status;
    _conditions = widget.reference.conditions!.toList();
    _actions = widget.reference.actions!.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          widget.reference.name!,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
            "${_conditions.length} ${_conditions.length == 1 ? "Condition" : "Conditions"} - ${_actions.length} ${_actions.length == 1 ? "Action" : "Actions"}"),
        trailing: Container(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _status == "enabled"
                  ? const Icon(
                      Icons.check,
                      color: Color.fromRGBO(15, 163, 47, 1),
                    )
                  : Icon(
                      Icons.clear,
                      color: Theme.of(context).errorColor,
                    ),
              _status == "enabled"
                  ? const Text(
                      "Active",
                      style: TextStyle(color: Color.fromRGBO(15, 163, 47, 1)),
                    )
                  : Text(
                      "Inactive",
                      style: TextStyle(color: Theme.of(context).errorColor),
                    ),
            ],
          ),
        ),
        onTap: () => Navigator.pushNamed(
            context, SingleRuleOverviewScreen.routeName,
            arguments: widget.reference.id),
      ),
    );
  }
}
