import 'package:crudlp3/models/database.dart';
import 'package:flutter/material.dart';

class AddStudentScreen extends StatelessWidget {
  const AddStudentScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerNome = TextEditingController();
    TextEditingController _controllerEmail = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Cadastrar Pessoas",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              ),
            ),
          ),
            TextFormField(
              controller: _controllerNome,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Nome',
                labelStyle: TextStyle(color: Colors.white,), 
                ),
              style: TextStyle(color: Colors.white),
            ),
            TextFormField(
              controller: _controllerEmail,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            Row(
              children: [
                // Adiciona
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 10),
                  child: ElevatedButton(
                    onPressed: (){
                      Future<void> getConect = Database.addEstudante(
                        _controllerNome.text, 
                        _controllerEmail.text);
                      getConect.whenComplete(() => true);
                      if(true){
                        _controllerNome.clear();
                        _controllerEmail.clear();
                      }
                    },
                    child: Icon(Icons.add),
                  ),
                ),
                // Remove
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 10),
                  child: ElevatedButton(
                      onPressed: null,
                      child: Icon(Icons.remove),
                    ),
                ),
                Padding(
                  // Update
                  padding: const EdgeInsets.only(top: 20, right: 10),
                  child: ElevatedButton(
                      onPressed: null,
                      child: Icon(Icons.arrow_upward),
                    ),
                ),
                // Pesquisa
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 10),
                  child: ElevatedButton(
                      onPressed: null,
                      child: Icon(Icons.search),
                    ),
                ),
              ],
            ), 
        ],),
      ),
    );
  }
}