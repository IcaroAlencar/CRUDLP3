import 'package:crudlp3/models/database.dart';
import 'package:flutter/material.dart';

class AddDeviceScreen extends StatelessWidget {
  const AddDeviceScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerModelo = TextEditingController();
    TextEditingController _controllerMarca = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Cadastrar Device's",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              ),
            ),
          ),
            TextFormField(
              controller: _controllerMarca,
              decoration: InputDecoration(
                icon: Icon(Icons.library_books),
                labelText: 'Marca',
                labelStyle: TextStyle(color: Colors.white,), 
                ),
              style: TextStyle(color: Colors.white),
            ),
            TextFormField(
              controller: _controllerModelo,
              decoration: InputDecoration(
                icon: Icon(Icons.home),
                labelText: 'Modelo',
                labelStyle: TextStyle(
                  color: Colors.white
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
                      Future<void> getConect = Database.addDevice(
                        _controllerMarca.text, 
                        _controllerModelo.text
                      );
                      getConect.whenComplete(() => true);
                      if(true){
                        _controllerMarca.clear();
                        _controllerModelo.clear();
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