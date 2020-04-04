import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Characters extends StatefulWidget {
  @override
  _CharactersState createState() => _CharactersState();
}

  int skip = 1;
  String _baseUrl = "https://rickandmortyapi.com/api/character/";

  Future<List>fetch() async {
    http.Response response = await http.get(_baseUrl + "\$page=$skip");
    var json =  jsonDecode(response.body);
    return json["results"];
  }

class _CharactersState extends State<Characters> {
  ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: fetch(),
      builder: (context, snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.done:
            if(snapshot.hasError) {
              return Text("Ocorreu algum erro durante a execução");
            } else {
              return ListView.builder(
                controller: _scrollController,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return  Card(
                      elevation: 2,
                      child: Container(
                        height: 130,
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  topLeft: Radius.circular(5)
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(snapshot.data[index]["image"])
                                )
                              ),
                            ),
                            Container(
                              height: 100,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(snapshot.data[index]["name"], style:
                                    TextStyle(
                                      color: Color.fromRGBO(58, 71, 103, 1),
                                      fontWeight: FontWeight.bold
                                    ),),
                                    Divider(),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Color.fromRGBO(247,240,123, 1)),
                                        borderRadius: BorderRadius.all(Radius.circular(25))
                                      ),
                                      child: Text(snapshot.data[index]["status"], textAlign: TextAlign.center,),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    );
                },
              );
            }
        }
      },
      );
  }
}