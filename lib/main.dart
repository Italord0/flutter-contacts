import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _contactList = [];

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<File> _getData()  async {
    final directory = await getApplicationDocumentsDirectory();
    return File(directory.path+"/contacts.json");
  }

  Future<File> _saveData() async {
    String data = json.encode(_contactList);
    final file = await _getData();
    return file.writeAsString(data);
  }

  Future<String> _readData() async{
    try{
      final file = await _getData();
    }catch(e){
      null;
    }
  }
}
