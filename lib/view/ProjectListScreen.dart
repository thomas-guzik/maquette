import 'package:flutter/material.dart';
// ignore_for_file: file_names
import '../entity/Project.dart';
import '../entityStory/ProjectOperation.dart';
import '../view/ProjectFormScreen.dart';

class ProjectListScreen extends StatefulWidget {
  List<Project> projects;
  ProjectListScreen({Key? key, required this.projects}) : super(key: key);

  @override
  State<ProjectListScreen> createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends State<ProjectListScreen> {
    ProjectOperation projectOperation = ProjectOperation();
  @override
  Widget build(BuildContext context) {
    var projects = widget.projects;
    //var projects = projectOperation.listAll();

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
                title: Text(projects[index].title ?? "NO"),
                subtitle: Text(projects[index].subtitle ?? "NO"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ProjectFormScreen(project: projects[index], update: (Project p) {
                            print("2  " + (p.subtitle ?? ""));
                            setState(() {
                              projects[index] = p;
                              projects[index].subtitle = p.subtitle;
                              });
                            print("3  " + (projects[index].subtitle ?? ""));
                            }
                            )));});
          }),
        ),
      );
  }
  }
