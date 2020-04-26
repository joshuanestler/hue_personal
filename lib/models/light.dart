import 'package:huepersonal/models/lightState.dart';

class Light {

  final int id;
  final String name, type, modelID, manufacturerName, productName, uniqueID;
  final LightState state;

  Light({this.id, this.name, this.type, this.modelID, this.manufacturerName, this.productName, this.uniqueID, this.state});

  factory Light.fromJSON(Map<String, dynamic> json) {
    return Light(
      id: json["id"],
      name: json["name"],
      manufacturerName: json["manufacturername"],
      modelID: json["modelid"],
      type: json["type"],
      productName: json["productname"],
      uniqueID: json["uniqueid"],
      state: LightState.fromJSON(json["state"])
    );
  }

  void toggleOn() {

  }
}