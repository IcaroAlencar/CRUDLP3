import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudlp3/models/database.dart';
import 'package:crudlp3/screens/estudantes/edit_student_screen.dart';
import 'package:flutter/material.dart';

class ListStudentScreen extends StatefulWidget {
  const ListStudentScreen({ Key? key }) : super(key: key);

  @override
  _ListStudentScreenState createState() => _ListStudentScreenState();
}

class _ListStudentScreenState extends State<ListStudentScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Database.ListStudent(),
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Text("Erro ao acessar os dados");
        }else if(snapshot.hasData || snapshot.data != null){
          return ListView.separated(
            itemBuilder: (BuildContext context, int index){
              String docId = snapshot.data!.docs[index].id;
              String docNome = snapshot.data!.docs[index].get('nome');
              String docEmail = snapshot.data!.docs[index].get('email');
              return Card(
                child: ListTile(
                  leading: Icon(Icons.account_circle, size: 50),
                  title: Text("Nome: $docNome"),
                  subtitle: Text("Email: $docEmail"),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditStudentScreen(
                        id: docId, nomeOld: docNome, emailOld: docEmail
                      ),
                    ),
                  ),
                ),
              );
            }, 
            separatorBuilder: (BuildContext context, int index) => SizedBox(height: 5,),
            itemCount: snapshot.data!.docs.length,
          );
        }else{
          return Container(
            child: Text("Molhou pai... alguma coisa saiu fora do controle!!"),
          );
        }
      }
    );
  }
}