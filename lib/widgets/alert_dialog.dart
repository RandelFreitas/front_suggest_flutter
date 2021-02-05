import 'package:flutter/material.dart';

class AlertDialogWid {
  final BuildContext context;
  final String text;

  AlertDialogWid(this.context, this.text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Atenção!"),
          content: Text(
            text,
            textAlign: TextAlign.center,
          ),
          actions: [
            ElevatedButton(
              child: Text("ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
