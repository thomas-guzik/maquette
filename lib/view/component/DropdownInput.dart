// ignore_for_file: file_names

import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class DropdownInput extends StatefulWidget {
  final String title;
  final List<String> items;
  String value;
  Function(String) update;
  DropdownInput(
      {Key? key,
      required this.title,
      required this.items,
      required this.value,
      required this.update})
      : super(key: key);

  @override
  State<DropdownInput> createState() => _DropdownInputState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _DropdownInputState extends State<DropdownInput> {
  _DropdownInputState();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
          width: width / 4,
          child: Text(widget.title),
        ),
        Expanded(
            child: DropdownButton<String>(
          isExpanded: true,
          value: widget.value,
          onChanged: (String? v) {
            widget.update(v!);
          },
          items: widget.items.map<DropdownMenuItem<String>>((String v) {
            return DropdownMenuItem<String>(
              value: v,
              child: Text(v),
            );
          }).toList(),
        ))
      ],
    );
  }
}
