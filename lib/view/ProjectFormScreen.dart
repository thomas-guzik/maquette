// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:maquette/view/component/DropdownInput.dart';
import '../entity/Project.dart';

class ProjectFormScreen extends StatefulWidget {
  Project project;
  ProjectFormScreen({Key? key, required this.project}) : super(key: key);

  @override
  _ProjectFormScreenState createState() => _ProjectFormScreenState();
}

class _ProjectFormScreenState extends State<ProjectFormScreen> {
  _ProjectFormScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Projet"),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Builder(
            builder: (context) => Form(
              child: Column(
                children: [
                  TextFormField(
                    initialValue: widget.project.title,
                    decoration: InputDecoration(labelText: 'Projet'),
                    onChanged: (String s) {
                      print("tata"+ s);
                      setState(() => widget.project.title = s);
                    },

                  ),
                  DropdownInput(
                    items: ["", "One", "Two", "Three"],
                    value: widget.project.dropdownValue,
                    title: 'Dropdown title',
                    update: (String s) {
                      setState(() =>
                        widget.project.dropdownValue = s
                      );
                    },
                  ),
                  Text("Value" + widget.project.dropdownValue),
                ],
              ),
            ),
          ),
        ));
  }
}
