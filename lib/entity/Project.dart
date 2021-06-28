import 'Person.dart';

class Project {
  String? title;
  String? subtitle;
  double? size;
  bool? okay;
  List<Person>? persons;
  String dropdownValue;
  String? id;

  Project(
      {this.title,
      this.size,
      this.okay,
      this.persons,
      this.dropdownValue = "",
      this.subtitle,
      this.id});
}
