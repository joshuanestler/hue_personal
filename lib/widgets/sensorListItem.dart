import 'package:flutter/material.dart';
import 'package:hue_dart/hue_dart.dart';

class SensorListItem extends StatefulWidget {
  final Sensor reference;
  SensorListItem(this.reference);

  @override
  _SensorListItemState createState() => _SensorListItemState();
}

class _SensorListItemState extends State<SensorListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          widget.reference.name,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(widget.reference.type),
      ),
    );
  }
}
