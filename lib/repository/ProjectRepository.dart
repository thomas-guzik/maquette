// ignore_for_file: file_names

import '../entity/Project.dart';

class ProjectRepository {
  
  List<Project> listProject = [];

  ProjectRepository() {
    listProject = [
      Project(id: '1', title:'hello', size:2),
      Project(id: '2', title:'world', size:5),
    ];
  }

  List<Project> listAll() {
    return listProject;
  }

  Project create(Project p) {
    listProject.add(p);
    return p;
  }

  Project update(Project p) {
    int? select = find(p);
    if(select == null) {
      return create(p);
    } else {
      listProject[select] = p;
      return p;
    } 
  }

  Project delete(Project p) {
    listProject.remove(p);
    return p;
  }

  int? find(Project p) {
    for(int i = 0; i < listProject.length; i++) {
      if(listProject[i].id == p.id) {
        return i;
      }
    }
    return null;
  }
}