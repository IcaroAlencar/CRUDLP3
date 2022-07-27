import 'dart:async';
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _mainReference = _firestore.collection("pessoa");

  final FirebaseFirestore _firestoreDevice = FirebaseFirestore.instance;
  final CollectionReference _mainReferenceDevice = _firestoreDevice.collection("device");

class Database{
  static DocumentReference _documentReference = _mainReference.doc();
  static DocumentReference _documentReferenceDevice = _mainReferenceDevice.doc();
  
  // Adicionar Estudante
  static Future<void> addEstudante(String nome, String email) async {
    DocumentReference _documentReference = _mainReference.doc();
    Map<String , dynamic> data = <String, dynamic>{
      "nome"  : nome,
      "email" : email,
    };
   await _documentReference.set(data).whenComplete(() => print('estudante adicionado com sucesso'));
  }
  // Adicionar Estudante Fim

  // Lista todos os estudantes
  static Stream<QuerySnapshot> ListStudent(){
    return _mainReference.snapshots();
  }
   // Lista todos os estudantes Fim


   // Deleta o estudante selecionado
  static Future<void> deleteStudente({required String id}) async{
    DocumentReference documentReference = _mainReference.doc(id);
    await documentReference
    .delete()
    .whenComplete(() => print('Deletado com sucesso!!'))
    .catchError((e) => print(e));
  }
   // Deleta o estudante selecionado Fim

   // Atualiza o estudandte selecionado 
  static Future<void> updateStudent({required idNew, required String nomeNew, required String emailNew}) async {
    DocumentReference documentReference = _mainReference.doc(idNew);
    Map<String , dynamic> data = <String, dynamic>{
      "nome"  : nomeNew,
      "email" : emailNew,
    };
    await documentReference
    .update(data)
    .whenComplete(() => print("Dados Atualizados"));
  }
     // Atualiza o estudandte selecionado Fim


    // Adiciona o curso
  static Future<void> addDevice(String marca, String modelo) async {
    DocumentReference _documentReferenceDevice = _mainReferenceDevice.doc();
    Map<String , dynamic> data = <String, dynamic>{
      "marca"  : marca,
      "modelo" : modelo,
    };
   await _documentReferenceDevice.set(data).whenComplete(() => print("Inserido Com sucesso"));
   print(_documentReferenceDevice.id);
  }
  // Adiciona o curso Fim


  // Lista todos os cursos
  static Stream<QuerySnapshot> ListDevice(){
    return _mainReferenceDevice.snapshots();
  }
  // Lista todos os cursos fim


  // deleta o curso selecionado 
  static Future<void> deleteDevice({required String id}) async{
    DocumentReference documentReferenceDevice = _mainReferenceDevice.doc(id);
    await documentReferenceDevice
    .delete()
    .whenComplete(() => print('Deletado com sucesso!!'))
    .catchError((e) => print(e));
  }
  // deleta o curso selecionado fim

  // Atualiza o curso selecionado 
   static Future<void> updateDevice({required idNew, required String marcaNew, required String modeloNew}) async {
    DocumentReference documentReferenceDevice = _mainReferenceDevice.doc(idNew);
    Map<String , dynamic> data = <String, dynamic>{
      "marca"  : marcaNew,
      "modelo" : modeloNew,
    };
    await documentReferenceDevice
    .update(data)
    .whenComplete(() => print("Dados Atualizados"));
    print(documentReferenceDevice.id);
    print(idNew);
    print(marcaNew);
    print(modeloNew);
  }
  // Atualiza o curso selecionado fim

}