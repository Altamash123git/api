import 'package:flutter/material.dart';
import 'dart:io';
class SecondPage extends StatelessWidget {
 String? name;
 File? img;
 SecondPage({required this.name,required this.img});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
      child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
        CircleAvatar(
         backgroundImage: FileImage(img!),
         radius: 60,
        ),
        Text("Name= ${name!}",style: TextStyle(fontSize: 20),)
       ],
      ),
     ),
    );
  }
}
