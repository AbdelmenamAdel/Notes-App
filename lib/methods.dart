import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

Future<void> cupertinoDialog(context, String text, onPressed) async {
  switch (await showDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('Confirmation !'),
        content: Text('Do you want to $text this note'),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: onPressed,
            child: const Text('Yes'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context, 'No');
            },
            child: const Text('No'),
          ),
        ],
      );
    },
  )) {}
}

void showSnackBar(String text, String ans, context) {
  final SnackBar snackBar = SnackBar(
      duration: const Duration(milliseconds: 500),
      backgroundColor: ans.compareTo('Yes') == 0 ? kPrimaryColor : Colors.red,
      content: Row(
        children: <Widget>[
          Icon(
            ans.compareTo('Yes') == 0 ? Icons.favorite : Icons.watch_later,
            color: ans.compareTo('Yes') == 0 ? Colors.pink : Colors.yellow,
            size: 24.0,
            semanticLabel: text,
          ),
          Text(' $text')
        ],
      ));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
