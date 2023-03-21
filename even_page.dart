import 'package:flutter/material.dart';
//import 'package:animator/animator.dart';

import 'package:gestion_hotellerie/pages/hotelpage.dart';
import 'package:gestion_hotellerie/pages/chambrepage.dart';
import 'package:gestion_hotellerie/pages/clientpage.dart';
import 'package:gestion_hotellerie/pages/reservationpage.dart';
import 'package:gestion_hotellerie/pages/facturepage.dart';
import 'package:gestion_hotellerie/pages/statistiquepage.dart';

class EvenPage extends StatelessWidget {
  const EvenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
        foregroundColor: Colors.black87,
        backgroundColor: Colors.grey[300],
        minimumSize: Size(88, 36),
        padding: EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2))));*/
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
                'Hotel',
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
                  ElevatedButton.icon(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                        backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const HotelPage()))
                    },
                    label: const Text("Gestion de l'hotel",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    icon: const Icon(Icons.house_rounded),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton.icon(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                        backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const ChambrePage()))
                    },
                    label: const Text("Chambres",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    icon: const Icon(Icons.bed),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton.icon(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                        backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const ClientPage()))
                    },
                    label: const Text("Clients",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    icon: const Icon(Icons.supervised_user_circle),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton.icon(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                        backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const ReservationPage()))
                    },
                    label: const Text("Reservations",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    icon: const Icon(Icons.edit_note),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton.icon(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                        backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const FacturePage()))
                    },
                    label: const Text("Factures",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    icon: const Icon(Icons.attach_money),
                  ),
                  SizedBox(
                    height: 25,
                    width: 80,
                  ),
                  ElevatedButton.icon(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                        backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const StatistiquePage()))
                    },
                    label: const Text("Statistiques",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    icon: const Icon(Icons.dvr_outlined),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
