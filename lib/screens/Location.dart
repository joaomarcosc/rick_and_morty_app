import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

const _baseUrl = "https://rickandmortyapi.com/api/location/?page=1";
Future<List> fetch() async {
  http.Response response = await http.get(_baseUrl);
  var json = jsonDecode(response.body);
  print(json["results"]);
  return json["results"];
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: fetch(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Center(
                child: Text("Erro ao carregar os arquivos"),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    child: Container(
                      height: 130,
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 250,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    topLeft: Radius.circular(5)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://i.imgur.com/vdU2Jlg.png"))),
                          ),
                          Container(
                            height: 100,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(snapshot.data[index]["name"]),
                                  Divider(),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color.fromRGBO(247,240,123, 1)),
                                      borderRadius: BorderRadius.all(Radius.circular(25))
                                    ),
                                    child: Text(snapshot.data[index]["type"], textAlign: TextAlign.center,),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
        }
      },
    );
  }
}
