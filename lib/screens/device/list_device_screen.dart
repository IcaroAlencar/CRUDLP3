import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudlp3/models/database.dart';
import 'package:crudlp3/screens/device/edit_device_screen.dart';
import 'package:flutter/material.dart';

class ListDeviceScreen extends StatefulWidget {
  const ListDeviceScreen({ Key? key }) : super(key: key);

  @override
  _ListDeviceScreen createState() => _ListDeviceScreen();
}

class _ListDeviceScreen extends State<ListDeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Database.ListDevice(),
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Text("Erro ao acessar os dados");
        }else if(snapshot.hasData || snapshot.data != null){
          return ListView.separated(
            itemBuilder: (BuildContext context, int index){
              String docId = snapshot.data!.docs[index].id;
              String docMarca = snapshot.data!.docs[index].get('marca');
              String docModelo = snapshot.data!.docs[index].get('modelo');
              return Card(
                child: ListTile(
                  title: Text("Marca: $docMarca"),
                  subtitle: Text("Modelo: $docModelo"),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditDeviceScreen(
                        id: docId, 
                        marcaOld: docMarca, 
                        modeloOld: docModelo
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