import 'package:flutter/material.dart';
import 'package:gestion_hotellerie/pages/infochambrepage.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Initialisation';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Initialisation',
            style: TextStyle(
                fontFamily: 'Signatra',
                fontSize: 60,
                color: Color.fromARGB(255, 0, 54, 49)),
          ),
          backgroundColor: Colors.white,
        ),
        body: const MonFormulaire(),
      ),
    );
  }
}

class MonFormulaire extends StatefulWidget {
  const MonFormulaire({super.key});

  @override
  MonFormulaireState createState() {
    return MonFormulaireState();
  }
}

class MonFormulaireState extends State<MonFormulaire> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final levelController = TextEditingController();
  final roomController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
    levelController.dispose();
    roomController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.all(30)),
          Container(
            margin: const EdgeInsets.all(30),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Donner le nom de l'hotel",
                labelText: "Nom de l'hotel",
                border: OutlineInputBorder(),
              ),
              controller: nameController,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(30),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Donner le nombre de niveau",
                labelText: "Nombre de niveau",
                border: OutlineInputBorder(),
              ),
              controller: levelController,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(30),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Donner le nombre de chambre par niveau",
                labelText: "Nombre de chambre par niveau",
                border: OutlineInputBorder(),
              ),
              controller: roomController,
            ),
          ),
          ElevatedButton(
            style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.all(30)),
                backgroundColor: MaterialStatePropertyAll(Colors.teal)),
            onPressed: () => {
              //final confName = nameController.text;
              //final confLevel = levelController.text;
              //final confRoom = roomController.text;
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const InfochambrePage()))
            },
            child: Text(
              "Suivant",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
