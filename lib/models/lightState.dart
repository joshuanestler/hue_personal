import 'package:flutter/painting.dart';

class LightState {
  final bool on, reachable;
  final num brightness, hue, saturation, ct;
  final Color color;
  final List<num> xy;
  final LightEffect effect;
  final LightAlert alert;
  final LightColorMode colorMode;

  LightState({this.on, this.reachable, this.brightness, this.hue, this.saturation, this.ct, this.xy, this.effect, this.alert, this.colorMode}) : this.color = HSVColor.fromAHSV(1, hue, saturation, 1).toColor();

  factory LightState.fromJSON(Map<String, dynamic> json) {
    return LightState(
      on: json["on"],
      reachable: json["reachable"],
      brightness: json["bri"],
      hue: json["hue"],
      saturation: json["saturation"],
      alert: getLightAlert(json["alert"]),
      effect: getLightEffect(json["effect"]),
      colorMode: getLightColorMode(json["colormode"]),
      ct: json["ct"],
      xy: [json["xy"][0], json["xy"][1]]
    );
  }

  static LightEffect getLightEffect(String str) {
    switch (str) {
      case "none":
        return LightEffect.none;
      case "colorloop":
        return LightEffect.colorloop;
      default:
        throw Error();
    }
  }

  static LightColorMode getLightColorMode(String str) {
    switch (str) {
      case "ct":
        return LightColorMode.ct;
      case "xy":
        return LightColorMode.xy;
      case "hs":
        return LightColorMode.hs;
      default:
        throw Error();
    }
  }

  static LightAlert getLightAlert(String str) {
    switch (str) {
      case "none":
        return LightAlert.none;
      case "select":
        return LightAlert.select;
      case "lselect":
        return LightAlert.lselect;
      default:
        throw Error();
    }
  }
}

enum LightEffect {none, colorloop}
enum LightAlert {none, select, lselect}
enum LightColorMode {xy, ct, hs}