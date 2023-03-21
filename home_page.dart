import 'package:flutter/material.dart';
import 'package:gestion_hotellerie/pages/even_page.dart';

import 'infopage.dart';
//import 'package:flutter_svg/flutter_svg.dart';

//import 'even_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestion d'hotel"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logogh.png"),
            const Text(
              "Gestion de l'hotel",
              style: TextStyle(fontSize: 36, fontFamily: 'Poppins'),
            ),
            const Text(
              "Bienvenue dans le systeme de gestion d'hotel",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ElevatedButton.icon(
              style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
              onPressed: () => {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const EvenPage()))
              },
              label: const Text("Acceder", style: TextStyle(fontSize: 20)),
              icon: const Icon(Icons.houseboat_sharp),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton.icon(
              style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                  backgroundColor: MaterialStatePropertyAll(Colors.white)),
              onPressed: () => {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const InfoPage()))
              },
              label: const Text("Initialiser les informations de l'hotel",
                  style: TextStyle(fontSize: 20, color: Colors.teal)),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
