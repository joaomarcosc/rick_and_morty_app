
import 'package:flutter/material.dart';
import 'package:rick_and_morty/Content.dart';
import 'package:rick_and_morty/Home.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/",
  routes: {
    "/": (context) => Home(),
    "/content": (context) => Content()
  },
));

