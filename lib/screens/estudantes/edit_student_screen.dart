import 'package:crudlp3/models/database.dart';
import 'package:crudlp3/screens/estudantes/edit_form_student.dart';
import 'package:flutter/material.dart';

class EditStudentScreen extends StatelessWidget {
  const EditStudentScreen({ Key? key,
   required this.id, 
   required this.nomeOld,
    required this.emailOld}) : super(key: key);

  final String id;
  final String nomeOld;
  final String emailOld;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      body: EditFormStudent(id: id, nome: nomeOld, email: emailOld),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Edição de dados"),
        actions: [
          IconButton(
            onPressed: () async {
              await Database.deleteStudente(id: id);
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.delete,
              color: Colors.black,
              size: 32,
            ),
          )
        ],
      ),
    );
  }
}