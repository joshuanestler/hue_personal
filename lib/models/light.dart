import 'package:flutter/widgets.dart';

class Light with ChangeNotifier {
  String id, name;
  Icon icon;
  LightEffect effect;
  ColorMode colorMode;
  int saturation, hue, brightness;
  int x, y;

  Light.initialized({this.id, this.name, this.saturation, this.brightness, this.hue});

}

enum LightEffect {
  None, Colorloop
}
enum ColorMode {
  ct, xy, hs
}