import 'package:flutter/material.dart';

void main() {
  runApp(const MondeArgentApp());
}

class MondeArgentApp extends StatelessWidget {
  const MondeArgentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Le Monde de l'Argent",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Le Monde de l'Argent et Or"),
        centerTitle: true,
        backgroundColor: Colors.amber[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildCard(
              titre: "OR - Prix du Gramme",
              prix: "68,50 €",
              variation: "+0,85% aujourd'hui",
              couleur: Colors.amber,
              icon: Icons.star,
            ),
            const SizedBox(height: 16),
            _buildCard(
              titre: "ARGENT - Prix du Gramme",
              prix: "0,89 €",
              variation: "+1,20% aujourd'hui",
              couleur: Colors.grey,
              icon: Icons.circle,
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber),
              ),
              child: const Column(
                children: [
                  Text("Convertisseur", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("1 kg d'Or = 68 500 €\n1 kg d'Argent = 890 €\n\nMise à jour quotidienne du cours mondial."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required String titre, required String prix, required String variation, required Color couleur, required IconData icon}) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: Icon(icon, size: 40, color: couleur),
        title: Text(titre, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(variation, style: const TextStyle(color: Colors.green)),
        trailing: Text(prix, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
