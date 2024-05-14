import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:kos_project/view_model/daftarkosdetailprovider.dart';

class DaftarKosDetail extends StatelessWidget {
  final String imagePath;
  final String nameKos;
  final String harga;
  final String fasilitas;
  final String phoneNumber;
  final String deskripsi;

  DaftarKosDetail({
    required this.imagePath,
    required this.nameKos,
    required this.harga,
    required this.fasilitas,
    required this.phoneNumber,
    required this.deskripsi,
  });

  @override
  Widget build(BuildContext context) {
    final daftarKosDetailProvider = Provider.of<DaftarKosDetailProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(nameKos, style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xFFEDDACF),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/home');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(imagePath),
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: Text(
                  nameKos,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Center(
                child: Text(
                  "Harga: $harga",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Center(
                child: Text(
                  "Fasilitas: $fasilitas",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    deskripsi,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    launch('whatsapp://send?phone=${daftarKosDetailProvider.phoneNumber}');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.brown,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Hubungi Pemilik Kos",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
