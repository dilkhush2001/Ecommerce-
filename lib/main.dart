import 'package:flutter/material.dart';
import 'package:upcoming/login_page.dart';
import 'package:upcoming/page1.dart';
import 'package:upcoming/page2.dart';

import 'loginprofil.dart';
void main(){
  return runApp(myapp());
}
class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:login(),
      );
  }
}

