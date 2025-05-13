// penjualan_page.dart
import 'package:flutter/material.dart';

class PenjualanPage extends StatefulWidget {
  @override
  _PenjualanPageState createState() => _PenjualanPageState();
}

class _PenjualanPageState extends State<PenjualanPage> {
  final _namaController = TextEditingController();
  final _jumlahController = TextEditingController();

  final List<Map<String, dynamic>> daftarTiket = [
    {
      "namaBus": "Sinar Jaya",
      "tujuan": "Jakarta - Surabaya",
      "harga": 300000,
    },
    {
      "namaBus": "Rosalia Indah",
      "tujuan": "Solo - Bandung",
      "harga": 250000,
    },
    {
      "namaBus": "Rimba Raya",
      "tujuan": "Semarang - Jakarta",
      "harga": 230000,
    },
    {
      "namaBus": "Tunas Muda Transportation",
      "tujuan": "Yogyakarta - Jakarta",
      "harga": 3000000,
      "jam": "19:00 WIB"
    },
  ];

  Map<String, dynamic>? _tiketDipilih;
  String _hasil = '';

  void _hitungTotal() {
    final nama = _namaController.text;
    final jumlah = int.tryParse(_jumlahController.text) ?? 0;

    if (_tiketDipilih == null || nama.isEmpty || jumlah <= 0) {
      setState(() {
        _hasil = '⚠️ Harap isi semua data dengan benar.';
      });
      return;
    }

    final total = jumlah * _tiketDipilih!['harga'];

    setState(() {
      _hasil =
          '👤 Pembeli: $nama\n🚌 Bus: ${_tiketDipilih!['namaBus']}\n🛣️ Tujuan: ${_tiketDipilih!['tujuan']}\n🎫 Jumlah Tiket: $jumlah\n💰 Total Bayar: Rp $total';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              "Penjualan Tiket",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      controller: _namaController,
                      decoration: InputDecoration(
                        labelText: "Nama Pembeli",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    DropdownButtonFormField<Map<String, dynamic>>(
                      decoration: InputDecoration(
                        labelText: "Pilih Tiket Bus",
                        prefixIcon: Icon(Icons.directions_bus),
                        border: OutlineInputBorder(),
                      ),
                      value: _tiketDipilih,
                      items: daftarTiket.map((tiket) {
                        return DropdownMenuItem<Map<String, dynamic>>(
                          value: tiket,
                          child: Text('${tiket['namaBus']} - ${tiket['tujuan']} (Rp ${tiket['harga']})'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _tiketDipilih = value;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _jumlahController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Jumlah Tiket",
                        prefixIcon: Icon(Icons.confirmation_num),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: _hitungTotal,
                      icon: Icon(Icons.calculate),
                      label: Text("Hitung Total"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    if (_hasil.isNotEmpty)
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _hasil,
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
