// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:maquette/view/component/Col.dart';

class Col1 extends Col {
  Widget widget;

  Col1(this.widget);

  Widget draw() {
    return widget;
  }

  List<Widget> getWidgets() {
    return <Widget>[widget];
  }
  
}