import 'package:flutter/material.dart';
import 'package:hue_dart/hue_dart.dart';
import 'package:huepersonal/main.dart';

class RuleConditionOverviewItem extends StatefulWidget {
  final Condition reference;

  RuleConditionOverviewItem(this.reference);

  @override
  _RuleConditionOverviewItemState createState() =>
      _RuleConditionOverviewItemState();
}

class _RuleConditionOverviewItemState extends State<RuleConditionOverviewItem> {
  String _address, _operator, _value;
  bool _isLoading = true;
  String _title, _subtitle;

  @override
  void initState() {
    _address = widget.reference.address;
    _operator = widget.reference.operator;
    _value = widget.reference.value;
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    if (_address.startsWith("/sensors")) _sensorCondition();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const CircularProgressIndicator()
        : Card(
            child: ListTile(
              title: Text(_title),
              subtitle: Text(_subtitle),
              trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  ),
                  onPressed: () {}),
            ),
          );
  }

  void _sensorCondition() async {
    String id = _address.replaceAll(RegExp("[^0-9]"), "");
    await MyApp.bridge.sensor(id).then((v) {
      setState(() {
        _title = _address;
        _subtitle = "$_operator - $_value";
        _isLoading = false;
      });
      if (_address.endsWith("buttonevent") && _operator == "eq") {
        setState(() {
          _title = v.name;
          _subtitle = buttonPress(v);
          _updatedStrings();
        });
      }
      if (_address.endsWith("lastupdated") &&
          (_operator == "dx" || _operator == "ddx")) {
        setState(() {
          _title = v.name;
          _subtitle = "Status updated";
          _updatedStrings();
        });
      }
    });
  }

  String buttonPress(Sensor s) {
    if (s.type == "ZLLSwitch") {
      String buttonNumber = "Button ${int.parse(_value[0])}";
      switch (_value[3]) {
        case "0":
          return "$buttonNumber - Initial Touch";
        case "1":
          return "$buttonNumber - Hold";
        case "2":
          return "$buttonNumber - Short Press";
        case "3":
          return "$buttonNumber - Long Press";
        default:
          throw Error();
      }
    }
    if (s.type == "ZGPSwitch") {
      switch (_value) {
        case "34":
          return "Button 1 - Press";
        case "16":
          return "Button 2 - Press";
        case "17":
          return "Button 3 - Press";
        case "18":
          return "Button 4 - Press";
        default:
          throw Error();
      }
    }
    return "$_operator - $_value";
  }

  void _updatedStrings() {
    print("Condition - Title replaced: $_address -> $_title");
    print("Condition - Subtitle replaced: $_operator - $_value -> $_subtitle");
  }
}
