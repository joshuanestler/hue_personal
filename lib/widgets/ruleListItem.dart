import 'package:flutter/material.dart';
import 'package:hue_dart/hue_dart.dart';

class RuleListItem extends StatefulWidget {

  final Rule reference;
  RuleListItem(this.reference);

  @override
  _RuleListItemState createState() => _RuleListItemState();
}

class _RuleListItemState extends State<RuleListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.reference.name, style: Theme.of(context).textTheme.title,),
      ),
    );
  }
}
