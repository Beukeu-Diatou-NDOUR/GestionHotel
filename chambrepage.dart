import 'package:flutter/material.dart';
import 'package:gestion_hotellerie/pages/reservationpage.dart';
import 'package:gestion_hotellerie/pages/statistiquepage.dart';

import 'chambrecategoriepage.dart';
import 'chambrelistepage.dart';
import 'chambremodifier.dart';
import 'chambreservicepage.dart';
import 'clientpage.dart';
import 'even_page.dart';
import 'facturepage.dart';

//import 'package:flutter_svg/flutter_svg.dart';

class ChambrePage extends StatelessWidget {
  const ChambrePage({super.key});

  static const String _title = 'Chambres';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: ChambrePageful(),
    );
  }
}

class ChambrePageful extends StatefulWidget {
  const ChambrePageful({Key? key}) : super(key: key);

  @override
  State<ChambrePageful> createState() => _ChambrePagefulState();
}

class _ChambrePagefulState extends State<ChambrePageful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "Gestion des Chambres",
                style: TextStyle(
                    fontFamily: 'Signatra',
                    fontSize: 70,
                    color: Color.fromARGB(255, 0, 54, 49)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                        backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const ChambrelistePage()))
                    },
                    child: const Text("Liste des chambres",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                        backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const ChambrecategoriePage()))
                    },
                    child: const Text("Les chambres par Categories",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                        backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const ChambreservicePage()))
                    },
                    child: const Text("Les chambres par Service",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                        backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const ChambremodifierPage()))
                    },
                    child: const Text("Modifier la classe d'une chambre",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                        backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const EvenPage()))
                    },
                    child: const Text("Retour",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 19),
          ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) =>
                            const MyStatefulWidget()));
              },
              icon: Icon(Icons.list),
              label: Text("Menu")),
        ],
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 1;
  static const List<Widget> _widgetOptions = <Widget>[
    EvenPage(),
    ChambrePage(),
    ClientPage(),
    ReservationPage(),
    FacturePage(),
    StatistiquePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.blueGrey,
        backgroundColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.house_rounded), label: "Hotel"),
          BottomNavigationBarItem(icon: Icon(Icons.bed), label: "Chambres"),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), label: "Clients"),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit_note), label: "Reservations"),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money), label: "Factures"),
          BottomNavigationBarItem(
              icon: Icon(Icons.dvr_outlined), label: "Statistiques")
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
