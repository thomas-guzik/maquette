// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:maquette/view/component/Col.dart';


class Col2 extends Col {
  Widget widget1;
  Widget? widget2;

  Col2(this.widget1, [this.widget2]);

  Widget draw() {
    return Row(children: [Expanded(child:widget1), Expanded(child:widget2 ?? Text(""))],);
    }

    List<Widget> getWidgets() {
    if(widget2 == null) {
      return <Widget>[widget1];
    } else {
      return <Widget>[widget1, widget2 as Widget];

    }
  }
}