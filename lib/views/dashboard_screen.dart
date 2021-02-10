import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Container(
            constraints: BoxConstraints(maxWidth: 1200),
            width: MediaQuery.of(context).size.width * 0.80,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12)
            ),
            child: Text("Dashboard"),
          ),
        ),
      ),
    );
  }
}