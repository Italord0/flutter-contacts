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

  List _contactList = ["Jefferson","Julião do ZapZap"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Expanded(
                  child:TextField(
                    decoration: InputDecoration(
                        labelText: "Contato a ser adicionado",
                        labelStyle: TextStyle(
                            color: Colors.red
                        )
                    ),
                  ) ,
                ),
                MaterialButton(
                  color: Colors.red,
                  child: Text("Adicionar"),
                  textColor: Colors.white,
                  onPressed: (){

                  },
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _contactList.length,
                itemBuilder: (context,index){
                  return ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text(_contactList[index]),
                    subtitle: Text("Numero vem aqui"),
                    trailing: Icon(Icons.phone),
                  );
                }),
          )
        ],
      ),
    );
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
