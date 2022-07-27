import 'dart:html';

import 'package:crudlp3/screens/device/add_device_screen.dart';
import 'package:crudlp3/screens/estudantes/add_student_screen.dart';
import 'package:crudlp3/screens/estudantes/list_student_screen.dart';
import 'package:crudlp3/screens/home_screen_device.dart';
import 'package:crudlp3/screens/home_screen_students.dart';
import 'package:flutter/material.dart';


class SelectScreen extends StatelessWidget {
  const SelectScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 1, 
      backgroundColor: Colors.white,
      title: Text("C O N S E R T P H O O N E", textAlign: TextAlign.right),
      ),
      backgroundColor: Colors.pink,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Pessoas",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20, right: 10),
                  child: ElevatedButton(
                    onPressed: (){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreenStudent()));
                    },
                    child: Icon(Icons.person, size: 30),
                  ),
                ),
            ],
          ),  
          
          Row(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 10),
                child: Text("Device's",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
               Padding(
                  padding: const EdgeInsets.only(top: 20, right: 10),
                  child: ElevatedButton(
                      onPressed: (){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreenDevice()));
                      },
                      child: Icon(Icons.devices, size: 30),
                    ),
                ),
            ],
          ), 
        ],),
      ),
    );//Scaffold
  }
}