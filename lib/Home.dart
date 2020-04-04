import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40),
        color: Color.fromRGBO(58,71,103, 1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/logo.png"),
              ButtonTheme(
                minWidth: 250.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      18.0
                    ),  
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/content");
                  },
                  child: Text("Acessar", style: 
                  TextStyle(fontSize: 20, color: Colors.white),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
