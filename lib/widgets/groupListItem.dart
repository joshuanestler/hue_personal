import 'package:flutter/material.dart';
import 'package:hue_dart/hue_dart.dart';

class GroupListItem extends StatefulWidget {

  final Group reference;
  GroupListItem(this.reference);

  @override
  _GroupListItemState createState() => _GroupListItemState();
}

class _GroupListItemState extends State<GroupListItem> {

  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.reference.name, style: Theme.of(context).textTheme.title,),
        subtitle: Text("Außen"),
        trailing: Switch(value: _isOn, onChanged: (v) {}),
      ),
    );
  }
}
