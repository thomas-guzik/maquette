// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../entity/Project.dart';

class ProjectFormScreen extends StatefulWidget {
  final Project project;
  ProjectFormScreen({required this.project });

  @override
  _ProjectFormScreenState createState() => _ProjectFormScreenState(project: project);
}

class _ProjectFormScreenState extends State<ProjectFormScreen> {

  final Project project;
  _ProjectFormScreenState({required this.project });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Projet"),),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Builder(builder: (context) => Form(child: Column(children: [TextFormField(
          decoration: InputDecoration(labelText: 'Projet'),
        )],),),),
      )
      
    );
  }
}