import 'package:crudlp3/screens/device/add_device_screen.dart';
import 'package:flutter/material.dart';

import 'device/list_device_screen.dart';


class HomeScreenDevice extends StatelessWidget {
  const HomeScreenDevice({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListDeviceScreen(),
      backgroundColor: Colors.blue.shade700,
      appBar: AppBar(
      elevation: 1, 
      backgroundColor: Colors.white,
      title: Text("C O N S E R T P H O O N E - DEVICE'S"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddDeviceScreen()));
          },
        child: Icon(Icons.add),
      ),
    );//Scaffold
  }
}