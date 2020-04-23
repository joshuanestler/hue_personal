import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hue_dart/hue_dart.dart' as hue;
import 'package:huepersonal/models/light.dart';

class LightListItem extends StatelessWidget {
  Light reference;

  LightListItem(this.reference);

  @override
  Widget build(BuildContext context) {
    hue.HueColor colorHelper = hue.ColorHelper().hueSaturationBrightnessToRGB(
        reference.hue, reference.saturation, reference.brightness);
    Color color = Color.fromRGBO((colorHelper.red * 256).toInt(),
        (colorHelper.green * 256).toInt(), (colorHelper.blue * 256).toInt(), 1);
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
        ),
        title: Text(reference.name),
        trailing: Switch(value: false, onChanged: (v) {}),
      ),
    );
  }
}
