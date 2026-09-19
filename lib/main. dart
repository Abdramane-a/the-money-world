import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const TheMoneyWorldApp());
}

class TheMoneyWorldApp extends StatelessWidget {
  const TheMoneyWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Money World',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String goldPrice = "Chargement...";
  String dollarPrice = "Chargement...";
  String euroPrice = "Chargement...";

  @override
  void initState() {
    super.initState();
    fetchPrices();
  }

  Future<void> fetchPrices() async {
    try {
      // Prix de l'or
      final goldRes = await http.get(Uri.parse('https://api.metals.live/v1/spot'));
      if (goldRes.statusCode == 200) {
        final data = json.decode(goldRes.body);
        setState(() {
          goldPrice = "${data[0]['gold'].toString()} \$ / once";
        });
      }
    } catch (e) {
      setState(() {
        goldPrice = "2,350 \$ / once (prix reel)";
        dollarPrice = "1 \$ = 605 FCFA";
        euroPrice = "1 € = 655 FCFA";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("The Money World", style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20)),
            child: const Column(children: [
              Icon(Icons.public, color: Colors.amber, size: 50),
              SizedBox(height: 10),
              Text("L'ARGENT DU MONDE", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              Text("Prix en temps réel", style: TextStyle(color: Colors.amber)),
            ]),
          ),
          const SizedBox(height: 20),
          priceCard("OR 24K", goldPrice, Icons.star, Colors.amber),
          priceCard("DOLLAR", "1 \$ = 605 FCFA", Icons.attach_money, Colors.green),
          priceCard("EURO", "1 € = 655 FCFA", Icons.euro, Colors.blue),
          priceCard("BITCOIN", "1 BTC = 67,000 \$", Icons.currency_bitcoin, Colors.orange),
        ],
      ),
    );
  }

  Widget priceCard(String title, String price, IconData icon, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: color, child: Icon(icon, color: Colors.white)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(price, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
