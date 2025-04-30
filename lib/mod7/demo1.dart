import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo Layout",
      home: AppHomePage(title: "Demo form"),
    );
  }
}

class AppHomePage extends StatelessWidget {
  String title;

  AppHomePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: DemoForm());
  }
}

class DemoForm extends StatefulWidget {
  @override
  State<DemoForm> createState() => _DemoFormState();
}

class _DemoFormState extends State<DemoForm> {
  bool isOk = false;
  String radio = "";

  void updateRadioValue(value) {
    setState(() {
      radio = value;
    });
  }

  String? validateName(String? value){
    if(value == null || value.trim().isEmpty){
      return "veuillez remplir votre nom! ";
    }
    if(value.length < 2){
      return "Votre nom doit contenir au moins 3 caractères";
    }
    return null;
  }

  String? validateAge(String? value){
    if(value == null || value.trim().isEmpty){
      return "veuillez remplir votre age! ";
    }
    if(int.parse(value) < 0){
      return "Votre age ne peut être négatif";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
            validator: validateName,
            decoration: InputDecoration(
              labelText: "Name",
              hintText: "Veuillez saisir votre nom !",
            ),
          ),
          TextFormField(
            validator: validateAge,
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
              DropdownMenuItem(child: Text("Disco Foot"), value: "Disco Foot"),
            ],
            onChanged: (value) {},
          ),
          Row(children: [
            Checkbox(
                value: isOk,
                onChanged: (value) {
                  setState(() {
                    isOk = value!;
                  });
                }),
            Text("La <form> ?")
          ]),
          Row(
            children: [
              Text("Vrai"),
              Radio<String>(
                value: "true",
                groupValue: radio,
                onChanged: updateRadioValue,
              ),
              Text("Faux"),
              Radio<String>(
                  value: "false",
                  groupValue: radio,
                  onChanged: updateRadioValue)
            ],
          ),
          ElevatedButton(onPressed: () {}, child: Text("Valider"))
        ],
      ),
    ));
  }
}
