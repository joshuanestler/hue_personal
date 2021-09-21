import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hue_dart/hue_dart.dart';
import 'package:hue_personal/main.dart';

class LightListItem extends StatefulWidget {
  final Light reference;
  LightListItem(this.reference);

  @override
  _LightListItemState createState() => _LightListItemState();
}

class _LightListItemState extends State<LightListItem> {
  LightType _type = LightType.OnOff;
  LightState? _state;
  Group? _group;

  @override
  void initState() {
    _state = widget.reference.state;
    _type = getType(widget.reference);
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    updateVariables();
    super.didChangeDependencies();
  }

  /// Darkens the color by given percentage (0...1)
  Color darken(Color color, double percentage) {
    int red = (color.red * (1 - percentage)).toInt();
    int green = (color.green * (1 - percentage)).toInt();
    int blue = (color.blue * (1 - percentage)).toInt();

    red = red > color.red ? 0 : red;
    green = green > color.green ? 0 : green;
    blue = blue > color.blue ? 0 : blue;

    return Color.fromRGBO(red, green, blue, color.opacity);
  }

  Color lighten(Color color, double percentage) {
    int red = (color.red * (1 + percentage)).toInt();
    int green = (color.green * (1 + percentage)).toInt();
    int blue = (color.blue * (1 + percentage)).toInt();

    red = red > 0xFF ? 0xFF : red;
    green = green > 0xFF ? 0xFF : green;
    blue = blue > 0xFF ? 0xFF : blue;

    return Color.fromRGBO(red, green, blue, color.opacity);
  }

  @override
  Widget build(BuildContext context) {
    Color color = calculateColor();
    Color darkColor = darken(color, 0.15);
    Color lightColor = lighten(color, 0.15);
    Color? frontColor = lightColor.computeLuminance() > 0.5
        ? Colors.black
        : color.alpha == 0
            ? Theme.of(context).textTheme.headline6!.color
            : Colors.white;
    bool brightnessModifiable =
        _state!.on! && _type != LightType.OnOff && _state!.reachable!;

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                begin: Alignment(-0.85, -0.9),
                end: Alignment(1.0, 0.85),
                colors: <Color>[lightColor, darkColor])),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.lightbulb_outline),
              ),
              title: Text(
                widget.reference.name!,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.apply(color: frontColor),
              ),
              subtitle: Row(
                children: [
                  Text("Room"),
                  Container(width: 20),
                  _state!.reachable!
                      ? const Text("")
                      : Text(
                          "Unreachable",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Theme.of(context).errorColor),
                        )
                ],
              ),
              trailing: Switch.adaptive(
                value: _state!.on!,
                onChanged: !_state!.reachable! ? null : toggleOnOff,
              ),
            ),
            _type == LightType.OnOff
                ? Container(height: 1)
                : Container(
                    height: 10,
                    margin: EdgeInsets.only(
                        top: 0, bottom: 10, left: 15, right: 15),
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: brightnessModifiable ? 10 : 6),
                        trackHeight: 10,
                        thumbColor: Colors.white,
                      ),
                      child: Slider.adaptive(
                        value: _type != LightType.OnOff
                            ? _state!.brightness!.toDouble()
                            : 1,
                        min: 1,
                        max: 254,
                        onChanged:
                            brightnessModifiable ? changeBrightness : null,
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Color calculateColor() {
    Color col = Color.fromRGBO(255, 250, 240, 1);

    if (_type == LightType.ColorLight) {}

    return _state!.on! && _type == LightType.ColorLight
        ? HSVColor.fromAHSV(1, (_state!.hue!.toDouble() / 65535) * 360,
                _state!.saturation!.toDouble() / 255, 1)
            .toColor()
        : (_type != LightType.ColorLight && _state!.on!
            ? Color.fromRGBO(255, 250, 240,
                _state!.brightness == null ? 1 : _state!.brightness!.toDouble())
            : Colors.transparent);
  }

  void changeBrightness(double value) async {
    final LightState newState = _state!.rebuild(
      (s) => s
        ..on = true
        ..brightness = value.floor(),
    );
    await updateLightState(newState);
  }

  void toggleOnOff(bool value) async {
    final LightState newState = _state!.rebuild((s) => s..on = value);
    await updateLightState(newState);
  }

  void updateVariables() async {
    await MyApp.bridge.light(widget.reference.id!).then((v) {
      setState(() {
        _state = v.state;
        _type = getType(v);
      });
    });
    _group = await MyApp.bridge.groups().then((value) =>
        value.firstWhere((g) => g.lightIds!.contains(widget.reference.id)));
  }

  Future<void> updateLightState(LightState newState) async {
    await MyApp.bridge.updateLightState(widget.reference.rebuild(
      (l) => l..state = newState.toBuilder(),
    ));
  }

  static LightType getType(Light ref) {
    LightState state = ref.state!;
    if (state.brightness != null) {
      if (state.hue != null) return LightType.ColorLight;
      return LightType.Dimmable;
    }
    return LightType.OnOff;
  }
}

enum LightType { ColorLight, Dimmable, OnOff }
