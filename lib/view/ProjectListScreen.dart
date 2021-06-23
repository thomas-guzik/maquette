import 'package:flutter/material.dart';
// ignore_for_file: file_names
import '../entity/Project.dart';
import '../entityStory/ProjectOperation.dart';
import '../view/ProjectFormScreen.dart';

class ProjectListScreen extends StatelessWidget {
  const ProjectListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProjectOperation projectOperation = ProjectOperation();
    List<Project> projects = projectOperation.listAll();

    return MaterialApp(
      title: 'Fiche Contact',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Liste des projets'),
        ),
        body: ListView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return ListTile(
                leading: Icon(Icons.toys),
                title: Text(projects[index].title as String),
                subtitle: Text('id: ' + projects[index].size.toString()),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ProjectFormScreen(project: projects[index])));
                });
          },
        ),
      ),
    );
  }
}
