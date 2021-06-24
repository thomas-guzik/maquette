// ignore_for_file: file_names

import '../entity/Project.dart';
import '../repository/ProjectRepository.dart';

class ProjectOperation {
  ProjectRepository repository = ProjectRepository();

  List<Project> listAll() {
    return repository.listAll();
  }

  Project create(Project p) {
    return repository.create(p);
  }

  Project update(Project p) {
    return repository.update(p);
  }

  Project delete(Project p) {
    return repository.delete(p);
  }
}
