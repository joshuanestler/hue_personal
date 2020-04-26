import 'package:flutter/material.dart';
import 'package:hue_dart/hue_dart.dart';

class ScheduleListItem extends StatefulWidget {

  final Schedule reference;
  ScheduleListItem(this.reference);

  @override
  _ScheduleListItemState createState() => _ScheduleListItemState();
}

class _ScheduleListItemState extends State<ScheduleListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.reference.name, style: Theme.of(context).textTheme.title,),
      ),
    );
  }
}
