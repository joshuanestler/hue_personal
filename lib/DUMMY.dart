import 'package:huepersonal/models/light.dart';

class Dummy {
  static List<Light> LIGHTS = [
    Light.initialized(
      name: "Test1",
      id: "1",
      brightness: 145,
      hue: 30000,
      saturation: 200
    ),
  ];
}