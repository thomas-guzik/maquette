// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:maquette/view/component/Col.dart';
import 'package:maquette/view/component/Col1.dart';
import 'package:maquette/view/component/Col2.dart';
import 'package:maquette/view/component/DropdownInput.dart';
import 'package:maquette/view/component/TextInput.dart';
import '../entity/Project.dart';

class ProjectFormScreen extends StatefulWidget {
  Project project;
  Function(Project) update;
  ProjectFormScreen({Key? key, required this.project, required this.update}) : super(key: key);

  @override
  _ProjectFormScreenState createState() => _ProjectFormScreenState();
}

class _ProjectFormScreenState extends State<ProjectFormScreen> {
  _ProjectFormScreenState();

List<Widget> matrix(List<Col> l) {
List<Widget> r = [];
for(var e in l) {
  r.add(e.draw());
}
return r;
}

  // List<Widget> matrix(List<Col> l) {
  //   List<Widget> ma = [];
  //   List<Widget> prev = [];
  //   bool canAddOnPrev = true;
  //   for(var i = 0; i < l.length; i+=2) {


  //     if(l[i].size == 2) {
  //       if(prev.length == 1) {
  //         ma.add(Row(children:prev));
  //       }
  //       ma.add(l[i].widget);
  //       prev = <Widget>[];
  //     } else {
  //         if(prev.length == 1) {
  //           prev.add(l[i].widget);
  //           ma.add(Row(children:prev));
  //           prev = <Widget>[];
  //         } else {
  //           prev = <Widget>[Expanded(child: l[i].widget)];
  //         }
  //     }
  //   }
  //   return ma;
  // }

  List<Widget> toWidget(List<Col> l) {
    List<Widget> r = [];
    for(var e in l) {
      r.addAll(e.getWidgets());
    }
    return r;
  }

//   List<Widget> matrix(List<Widget> l ) {
//     List<Widget> ma = [];
// for(var i = 0; i < l.length; i++) {
//     if(i % 2 == 0){
//         ma.add(Row(children: [Expanded(child:l[i]),Expanded(child:l[i+1])]));
//       }
// }
// return ma;

//   }

  @override
  Widget build(BuildContext context) {
      List<Col> _widgets = <Col>[
        Col2(
        TextFormField(
                    initialValue: widget.project.title,
                    decoration: InputDecoration(labelText: 'Projet'),
                    onChanged: (String s) {
                      setState(() => widget.project.title = s);
                    },

                  )),
                  Col2(DropdownInput(
                    items: ["", "One", "Two", "Three"],
                    value: widget.project.dropdownValue,
                    title: 'Dropdown title',
                    update: (String s) {
                      setState(() =>
                        widget.project.dropdownValue = s
                      );
                    },
                  ),
                  Text("Value" + widget.project.dropdownValue)),
                  Col1(TextInput(value: widget.project.subtitle, update: (s) {
                    print("0  " + (s??""));
                    widget.project.subtitle = s;
                    //setState(() => widget.project.subtitle = s);
                    print("1  " + (widget.project.subtitle??""));
                    widget.update(widget.project);
                  })),
                  Col2(Text("Value----------------------------------------------" + (widget.project.subtitle ?? "")),Text("---------------------------------------------------")),
                  Col1(Container(child: Text("Essai",textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),width: double.infinity,color: Colors.lightBlue.shade50,))
         ];

    return Scaffold(
        appBar: AppBar(
          title: Text("Projet"),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
  //             child: GridView.builder( 
  //  gridDelegate: 
  //  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
  //  itemCount: _widgets.length,
  //  itemBuilder: (context, index) {
  //    return Card(child:Container(child:_widgets[index]));
  //  }  
  //             ),
  child:LayoutBuilder(builder:(context, constraints) {
    if(constraints.maxWidth < 768) {
      return Column(children: toWidget(_widgets));
    }
    else {
      return Column(children: matrix(_widgets));
    }
  },)

        ));
  }
}
