import 'package:accessibility_flutter/main.dart';
import 'package:flutter/material.dart';

class ViewAccessbility extends StatefulWidget {
  @override
  _ViewAccessbilityState createState() => _ViewAccessbilityState();
}

class _ViewAccessbilityState extends State<ViewAccessbility> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DemoLocalizations.of(context).title),
      ),
      body: Center(
        child: Text(DemoLocalizations.of(context).title),
      ),
    );
  }
}
