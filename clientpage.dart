import 'package:flutter/material.dart';
import 'package:gestion_hotellerie/pages/reservationpage.dart';
import 'package:gestion_hotellerie/pages/statistiquepage.dart';



import 'chambrepage.dart';
import 'clienthotelpage.dart';
import 'clientlistepage.dart';
import 'clientreservespage.dart';
import 'clientsortentpage.dart';
import 'clientsupprimerpage.dart';
import 'even_page.dart';
import 'facturepage.dart';

//import 'package:flutter_svg/flutter_svg.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({Key? key}) : super(key: key);

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
 /* int _selectedIndex = 0;
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
    _widgetOptions.elementAt(_selectedIndex);
  }
  */

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
                "Gestion des clients",
                style: TextStyle(
                    fontFamily: 'Signatra',
                    fontSize: 80,
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
                                  const ClientlistePage()))
                    },
                    child: const Text("Liste des Clients",
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
                                  const ClientreservesPage()))
                    },
                    child: const Text("Liste des Clients reserves",
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
                                  const ClientsortentPage()))
                    },
                    child: const Text("Les clients qui sortent aujourd'hui",
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
                                  const ClienthotelPage()))
                    },
                    child: const Text("Les clients qui sont dans l'hotel",
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
                              pageBuilder: (_, __, ___) => const ClientsupprimerPage()))
                    },
                    child: const Text("Supprimer un Client",
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
  int _selectedIndex = 2;
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
