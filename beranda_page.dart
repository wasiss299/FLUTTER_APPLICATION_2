// beranda_page.dart
import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  final List<Map<String, dynamic>> daftarTiket = [
    {
      "namaBus": "Sinar Jaya",
      "tujuan": "Jakarta - Surabaya",
      "harga": 300000,
      "jam": "08:00 WIB"
    },
    {
      "namaBus": "Rosalia Indah",
      "tujuan": "Solo - Bandung",
      "harga": 250000,
      "jam": "10:30 WIB"
    },
    {
      "namaBus": "Rimba Raya",
      "tujuan": "Semarang - Jakarta",
      "harga": 230000,
      "jam": "13:00 WIB"
    },
    {
      "namaBus": "Tunas Muda Transportation",
      "tujuan": "Yogyakarta - Jakarta",
      "harga": 3000000,
      "jam": "19:00 WIB"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '🎟️ Tiket Bus Hari Ini',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: daftarTiket.length,
                itemBuilder: (context, index) {
                  final tiket = daftarTiket[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: EdgeInsets.only(bottom: 16),
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tiket["namaBus"],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800],
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("🛣️ ${tiket["tujuan"]}"),
                              Text("🕒 ${tiket["jam"]}"),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            "💰 Rp ${tiket["harga"]}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.green[700],
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
