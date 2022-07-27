import 'package:crudlp3/models/database.dart';
import 'package:flutter/material.dart';
class EditFormDevice extends StatefulWidget {
  const EditFormDevice({ Key? key, required this.id, required this.marca, required this.modelo }) : super(key: key);
  final String id;
  final String marca;
  final String modelo;

  @override
  _EditFormDeviceState createState() => _EditFormDeviceState();
}

class _EditFormDeviceState extends State<EditFormDevice> {
  late TextEditingController _controllerModelo;
  late TextEditingController _controllerMarca;

  @override
  void initState() {
    // TODO: implement initState
    _controllerModelo = TextEditingController(text: widget.modelo);
    _controllerMarca = TextEditingController(text: widget.marca);
    super.initState();
    print(widget.id);
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
                    controller: _controllerMarca, 
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      icon: Icon(Icons.library_books),
                      labelText: 'Marca',
                      labelStyle  : TextStyle(color: Colors.white,),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  TextFormField(
                    controller: _controllerModelo, 
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      icon: Icon(Icons.home),
                      labelText: 'Modelo',
                      labelStyle  : TextStyle(color: Colors.white,),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  ElevatedButton(onPressed: () async {
                    await Database.updateDevice(
                      idNew: widget.id, 
                      marcaNew: _controllerMarca.text, 
                      modeloNew: _controllerModelo.text);
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