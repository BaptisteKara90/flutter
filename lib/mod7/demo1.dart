import 'package:flutter/material.dart';

void main(){
  runApp(App());
}

class App extends StatelessWidget{

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo Layout",
      home: AppHomePage(title: "Demo form"),
    );
  }
}

class AppHomePage extends StatelessWidget{

  String title;

  AppHomePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar : AppBar(
          title: Text(this.title),
        ),
        body: DemoForm()
    );
  }
}


class DemoForm extends StatefulWidget{
  @override
  State<DemoForm> createState() => _DemoFormState();
}

class _DemoFormState extends State<DemoForm> {
  @override
  Widget build(BuildContext context) {
    return Form(child:
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Name",
              hintText: "Veuillez saisir votre nom !",
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Age",
              hintText: "Veuillez saisir votre age !",
            ),
          ),
          DropdownButtonFormField(
              items: [
                DropdownMenuItem(child: Text("Choisir sport :"), value: null),
                DropdownMenuItem(child: Text("Curling"), value: "Curling"),
                DropdownMenuItem(child: Text("Air Poney"), value: "Air Poney"),
                DropdownMenuItem(child: Text("Quidditch"), value: "Quidditch"),
                DropdownMenuItem(child: Text("Disco Foot"), value:"Disco Foot"),
              ],
              onChanged: (dynamic){},
          )
        ],
      ),
    ));
  }
}