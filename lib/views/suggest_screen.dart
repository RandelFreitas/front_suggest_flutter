import 'package:flutter/material.dart';

class SuggestScreen extends StatefulWidget {
  @override
  _SuggestScreenState createState() => _SuggestScreenState();
}

class _SuggestScreenState extends State<SuggestScreen> {

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
            child: Text("suggest"),
          ),
        ),
      ),
    );
  }
}