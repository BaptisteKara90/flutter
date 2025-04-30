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
      home: AppHomePage(title: "le projet"),
    );
  }
}

class AppHomePage extends StatefulWidget {
  String title;

  AppHomePage({required this.title});

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  double totalGlobal = 0;

  void updateTotal(double priceChange) {
    setState(() {
      totalGlobal =
          double.parse((totalGlobal + priceChange).toStringAsFixed(2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          CounterObject(
              object: "clavier", price: 50, onPriceChange: updateTotal),
          CounterObject(
              object: "écran", price: 200.99, onPriceChange: updateTotal),
          CounterObject(
              object: "manette", price: 49.99, onPriceChange: updateTotal),
          CounterObject(
              object: "stylo", price: 1.99, onPriceChange: updateTotal),
          const SizedBox(height: 20),
          Text("Total : ${totalGlobal.toStringAsFixed(2)} €"),
        ],
      ),
    );
  }
}

class CounterObject extends StatefulWidget {
  final String object;
  final double price;

  void Function(double) onPriceChange;

  CounterObject({
    required this.object,
    required this.price,
    required this.onPriceChange,
  });

  @override
  State<CounterObject> createState() => _CounterObjectState();
}

class _CounterObjectState extends State<CounterObject> {
  int count = 0;

  void addObject() {
    setState(() {
      count++;
    });
    widget.onPriceChange(widget.price);
  }

  void removeObject() {
    if (count > 0) {
      setState(() {
        count--;
      });
      widget.onPriceChange(-widget.price);
    }
  }

  @override
  Widget build(BuildContext context) {
    double total = widget.price * count;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Text(widget.object),
          Text('${widget.price} €'),
          ElevatedButton(onPressed: removeObject, child: Text("-")),
          Text("$count"),
          ElevatedButton(onPressed: addObject, child: Text("+")),
          SizedBox(width: 10),
          Text("${total.toStringAsFixed(2)} €")
        ],
      ),
    );
  }
}
