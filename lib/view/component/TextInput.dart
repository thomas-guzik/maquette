// ignore_for_file: file_names

import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class TextInput extends StatefulWidget {
  final String? title;
  String? value;
  Function(String?) update;
  TextInput(
      {Key? key,
      this.title,
      required this.value,
      required this.update})
      : 
      super(key: key);

  @override
  State<TextInput> createState() => _TextInputState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _TextInputState extends State<TextInput> {
  _TextInputState();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.value,
      decoration: InputDecoration(labelText: widget.title),
      onChanged: (String? s) {
        widget.update(s);
      },
    );
  }
}
