import 'package:crudlp3/models/database.dart';
import 'package:crudlp3/screens/device/edit_form_device.dart';
import 'package:flutter/material.dart';

class EditDeviceScreen extends StatelessWidget {
  const EditDeviceScreen({ Key? key,
   required this.id, 
   required this.marcaOld,
    required this.modeloOld}) : super(key: key);

  final String id;
  final String marcaOld;
  final String modeloOld;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      body: EditFormDevice(id: id, 
      marca: marcaOld, 
      modelo: modeloOld),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Edição de dados"),
        actions: [
          IconButton(
            onPressed: () async {
              await Database.deleteDevice(id: id);
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