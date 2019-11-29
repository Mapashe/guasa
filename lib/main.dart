import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final db= Firestore.instance;

void main() => runApp(Wasah());

class Wasah extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Estado();
      }
    }
    
class Estado extends State{
  final textomsj = TextEditingController();
  var mensajes=[];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green
        //accentColor: Colors.yellow[100]
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Wasah"),
        ),
        //body: ,
        body: Stack(children: <Widget>[
          Column(
              children: <Widget>[
                Expanded(
                  child: Material(
                    child: Text("  ")
                  ),
                ),
                BottomAppBar(
                child: Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 80,
                    bottom: 10,
                    top: 5
                    ),
                    child: TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.yellow,
                            labelText: "Escribe un mensaje",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            )
                          ),
                          controller: textomsj,
                        ),
                )
              ),
          ],
        ),
        StreamBuilder(
          stream: Firestore.instance.collection('Mensajes').snapshots(),
          builder: (context,snapshot){
            if(!snapshot.hasData)
              return Text('placeholder');
            return ListView(
              children: <Widget>[
                Card(child: ListTile(title: Text(snapshot.data.documents[8]['Mensaje']))),
                Card(child: ListTile(title: Text(snapshot.data.documents[9]['Mensaje']))),
                Card(child: ListTile(title: Text( snapshot.data.documents[10]['Mensaje']))),
                Card(child: ListTile(title: Text( snapshot.data.documents[11]['Mensaje']))),
                Card(child: ListTile(title: Text( snapshot.data.documents[12]['Mensaje']))),
                Card(child: ListTile(title: Text( snapshot.data.documents[13]['Mensaje']))),
                Card(child: ListTile(title: Text( snapshot.data.documents[14]['Mensaje']))),
                Card(child: ListTile(title: Text( snapshot.data.documents[15]['Mensaje']))),
              ],
            );
          }
        ),
        ],),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        backgroundColor: Colors.yellow,
        elevation: 0.0,
        onPressed: (){
          send(textomsj.text);
          textomsj.text='';
        },
      ),
      ),
    );
  }

}

void send(String text) async{
  await db.collection("Mensajes").add({'Mensaje':text });
}