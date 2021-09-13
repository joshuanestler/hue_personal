import 'package:built_value/json_object.dart';
import 'package:flutter/material.dart';
import 'package:hue_dart/hue_dart.dart';

class RuleActionOverviewItem extends StatefulWidget {
  final RuleAction reference;

  RuleActionOverviewItem(this.reference);

  @override
  _RuleActionOverviewItemState createState() => _RuleActionOverviewItemState();
}

class _RuleActionOverviewItemState extends State<RuleActionOverviewItem> {
  String? _address, _method;
  Map<String, JsonObject>? _body;
  bool _isLoading = true;
  String? _title, _subtitle;

  @override
  void initState() {
    _address = widget.reference.address;
    _method = widget.reference.method;
    _body = widget.reference.body!.asMap();
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    setState(() {
      _title = _address;
      _subtitle = "$_method - $_body";
      _isLoading = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const CircularProgressIndicator()
        : Card(
            child: ListTile(
              title: Text(_title!),
              subtitle: Text(_subtitle!),
              trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  ),
                  onPressed: () {}),
            ),
          );
  }
}
