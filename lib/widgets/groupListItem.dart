import 'package:flutter/material.dart';
import 'package:hue_dart/hue_dart.dart';
import 'package:hue_personal/main.dart';

class GroupListItem extends StatefulWidget {
  final Group reference;
  GroupListItem(this.reference);

  @override
  _GroupListItemState createState() => _GroupListItemState();
}

class _GroupListItemState extends State<GroupListItem> {
  bool? _isOn = false;

  @override
  Widget build(BuildContext context) {
    _isOn = widget.reference.state!.anyOn;
    return Card(
      child: ListTile(
        title: Text(
          widget.reference.name!,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        subtitle: Text(
            "${widget.reference.lightIds!.length} ${widget.reference.lightIds!.length == 1 ? "light" : "lights"}"),
        trailing: Switch.adaptive(value: _isOn!, onChanged: toggleGroupOnOff),
      ),
    );
  }

  Future<void> toggleGroupOnOff(bool on) async {
    await performGroupAction(
        widget.reference.action!.rebuild((v) => v..on = on));
  }

  Future<void> performGroupAction(GroupAction newAction) async {
    await MyApp.bridge.updateGroupState(
        widget.reference.rebuild((g) => g..action = newAction.toBuilder()));
  }
}
