import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) { // Made By Paul-Yann Bouvier
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clavier Numérique',
      home: const MyHomePage(),
    );
  }
}
 // Made By Paul-Yann Bouvier
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedNumber = -1; // -1 signifie aucun chiffre choisi

  void selectNumber(int number) {
    setState(() {
      selectedNumber = number;
    });
  }
// Made By Paul-Yann Bouvier
  void displayImage() {
    // Vous pouvez personnaliser la logique pour afficher l'image en fonction du chiffre choisi ici
    if (selectedNumber >= 0 && selectedNumber <= 9) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Image.asset(
              'lib/images/$selectedNumber.png',
              width: 200,
              height: 200,
            ),
          );
        },
      );
    }
  }

  Widget buildNumericButton(int number) {
    return ElevatedButton(
      onPressed: () {
        selectNumber(number);
      },
      child: Text('$number', style: TextStyle(fontSize: 20)),
    );
  }

  Widget buildNumericRow(List<int> numbers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Made By Paul-Yann Bouvier
      children: numbers
          .map(
            (number) => buildNumericButton(number),
          )
          .toList(),
    );
  }
// Made By Paul-Yann Bouvier
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clavier Numérique'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.blue),
              ),
              child: Text(
                selectedNumber >= 0 ? '$selectedNumber' : 'Aucun chiffre choisi',
                style: TextStyle(fontSize: 24),
              ),
            ), // Made By Paul-Yann Bouvier
            SizedBox(height: 20),
            // Utilisez des colonnes de 3 boutons chacune
            buildNumericRow([1, 2, 3]),
            buildNumericRow([4, 5, 6]),
            buildNumericRow([7, 8, 9]),
            buildNumericRow([0]),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                displayImage();
              },
              child: Text('Afficher l\'image'),
            ),
          ],
        ),
      ),
    );
  }
}
// Made By Paul-Yann Bouvier
