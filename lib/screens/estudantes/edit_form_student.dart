import 'package:crudlp3/models/database.dart';
import 'package:flutter/material.dart';
class EditFormStudent extends StatefulWidget {
  const EditFormStudent({ Key? key, required this.id, required this.nome, required this.email }) : super(key: key);
  final String id;
  final String nome;
  final String email;

  @override
  _EditFormStudentState createState() => _EditFormStudentState();
}

class _EditFormStudentState extends State<EditFormStudent> {
  late TextEditingController _controllerNome;
  late TextEditingController _controllerEmail;

  @override
  void initState() {
    // TODO: implement initState
    _controllerEmail = TextEditingController(text: widget.email);
    _controllerNome = TextEditingController(text: widget.nome);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  bottom: 24,
                  top: 20,
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  TextFormField(
                    controller: _controllerNome, 
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle),
                      labelText: 'Nome',
                      labelStyle  : TextStyle(color: Colors.white,),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  TextFormField(
                    controller: _controllerEmail, 
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: 'Email',
                      labelStyle  : TextStyle(color: Colors.white,),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  ElevatedButton(onPressed: () async {
                    await Database.updateStudent(
                      idNew: widget.id, 
                      nomeNew: _controllerNome.text, 
                      emailNew: _controllerEmail.text);
                    Navigator.of(context).pop();
                  }, child: Icon(Icons.arrow_upward),
                  ),
                ],
               ),
              )
            ],
          )
        ],
      )
    );
  }
}