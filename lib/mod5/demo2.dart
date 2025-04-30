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
      home: AppHomePage(title : "Demo widget de contenu"),
    );
  }
}

class AppHomePage extends StatelessWidget{
  String title;

  AppHomePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Coucou",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 36
                )
            ),
            ElevatedButton(
                onPressed: (){},
                style : ButtonStyle(
                    backgroundColor : WidgetStateProperty.all(Colors.amber)
                ),
                child: Text("Clique !")
            ),
            OutlinedButton(onPressed: (){}, child:Text("Clique !")),
            FilledButton(onPressed: (){}, child: Text("Clique !")),
            Image.network("https://upload.wikimedia.org/wikipedia/commons/d/d9/Female_goat_-_Public_Domain.jpg"),
            Image.asset("assets/images/herisson.jpg")
          ],
        ),
      )
    );
  }
}