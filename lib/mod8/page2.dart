import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget{




  @override
  Widget build(BuildContext context) {

    int? num = ModalRoute.of(context)!.settings.arguments as int?;

    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: Column(
        children: [
          Text("PAGE 2", style: TextStyle(fontSize: 56)),
          Text("${num}"),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Go back"))
        ],
      ),
    );
  }
}