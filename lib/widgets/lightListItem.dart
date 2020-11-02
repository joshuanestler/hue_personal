import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hue_dart/hue_dart.dart';
import 'package:huepersonal/main.dart';

class LightListItem extends StatefulWidget {
  final Light reference;
  LightListItem(this.reference);

  @override
  _LightListItemState createState() => _LightListItemState();
}

class _LightListItemState extends State<LightListItem> {
  LightType _type;
  LightState _state;
  Color _color;
  int _brightness;
  bool _isOn;

  @override
  void initState() {
    _state = widget.reference.state;
    _type = setType(widget.reference);
    _isOn = _state.on;
    _brightness = _state.brightness;
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    updateVariables();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _color = _isOn && _type == LightType.ColorLight
        ? HSVColor.fromAHSV(1, (_state.hue.toDouble() / 65535) * 360,
                _state.saturation.toDouble() / 255, 1)
            .toColor()
        : (_type != LightType.ColorLight && _state.on
            ? Color.fromRGBO(
                255, 250, 240, _brightness == null ? 1 : _brightness.toDouble())
            : Colors.transparent);
    return Card(
      color: _color,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              widget.reference.name,
              style: Theme.of(context).textTheme.headline6.apply(
                  color: _color.computeLuminance() < 0.5
                      ? Colors.white
                      : Colors.black),
            ),
            subtitle: _state.reachable
                ? const Text("")
                : Text(
                    "Unreachable",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Theme.of(context).errorColor),
                  ),
            trailing: Switch.adaptive(
              value: _isOn,
              onChanged: !_state.reachable
                  ? null
                  : (v) async {
                      setState(() {
                        _isOn = !_isOn;
                      });
                      await MyApp.bridge.updateLightState(widget.reference);
                    },
            ),
          ),
          _type != LightType.OnOff && _isOn
              ? Container(
                  height: 20,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackShape: CustomTrackShape(),
                      activeTrackColor: Colors.white,
                      trackHeight: 10,
                    ),
                    child: Slider.adaptive(
                      value: _brightness.toDouble(),
                      min: 0,
                      max: 255,
                      onChanged: (d) async {
                        setState(() {
                          _brightness = d.floor();
                        });
                        await MyApp.bridge.updateLightState(widget.reference);
                      },
                    ),
                  ),
                )
              : Container(height: 20)
        ],
      ),
    );
  }

  void updateVariables() async {
    await MyApp.bridge.light(widget.reference.id).then((v) {
      setState(() {
        _state = v.state;
        _type = setType(v);
        _isOn = _state.on;
        _color = _isOn && _type == LightType.ColorLight
            ? HSVColor.fromAHSV(1, (_state.hue.toDouble() / 65535) * 360,
                    _state.saturation.toDouble() / 255, 1)
                .toColor()
            : (_type == LightType.OnOff && _state.on
                ? Colors.white70
                : Colors.transparent);
      });
    });
  }

  static LightType setType(Light ref) {
    LightState state = ref.state;
    if (state.brightness != null) {
      if (state.hue != null) return LightType.ColorLight;
      return LightType.Dimmable;
    }
    return LightType.OnOff;
  }
}

class CustomTrackShape extends RectangularSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight);
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

enum LightType { ColorLight, Dimmable, OnOff }
