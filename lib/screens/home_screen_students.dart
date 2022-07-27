import 'package:crudlp3/screens/estudantes/add_student_screen.dart';
import 'package:crudlp3/screens/estudantes/list_student_screen.dart';
import 'package:flutter/material.dart';


class HomeScreenStudent extends StatelessWidget {
  const HomeScreenStudent({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListStudentScreen(),
      backgroundColor: Colors.blue.shade700,
      appBar: AppBar(
      elevation: 1, 
      backgroundColor: Colors.white,
      title: Text("C O N S E R T P H O O N E"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddStudentScreen()));
          },
        child: Icon(Icons.home),
      ),
    );//Scaffold
  }
}