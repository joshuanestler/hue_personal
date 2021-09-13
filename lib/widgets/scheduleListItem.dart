import 'package:flutter/material.dart';
import 'package:hue_dart/hue_dart.dart';

class ScheduleListItem extends StatefulWidget {
  final Schedule reference;
  ScheduleListItem(this.reference);

  @override
  _ScheduleListItemState createState() => _ScheduleListItemState();
}

class _ScheduleListItemState extends State<ScheduleListItem> {
  late bool _isActive;

  @override
  void initState() {
    _isActive = widget.reference.status == "enabled";
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
        subtitle: Text(widget.reference.description!),
        trailing: Switch(value: _isActive, onChanged: (v) {}),
      ),
    );
  }
}
