import 'package:kos_project/view/kos_list.dart';
import 'package:kos_project/view/daftar_kos.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Pemesanan")
        ],
        onTap: (int index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/pemesanan');
          }
        },
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                        height: 110, width: double.infinity, color: Colors.white),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                      alignment: Alignment.topLeft,
                                      height: 75,
                                      width: 75,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage('assets/logo_baru.png'),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.circular(0),
                                            border: Border.all(
                                                color: Colors.white,
                                                style: BorderStyle.solid,
                                                width: 2))),
                                                // SizedBox(
                                                //   width: 10,
                                                // ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
    Container(
      margin: EdgeInsets.only(right: 45), // Mengatur margin untuk jarak di bagian bawah
      child: Text(
        "Temukan",
        style: TextStyle(
          fontSize: 35, 
          fontWeight: FontWeight.bold
        ),
      ),
    ),
    Container(
      margin: EdgeInsets.only(bottom: 5, left: 25), // Mengatur margin untuk jarak di bagian bawah
      child: Text(
        "Kost Impian",
        style: TextStyle(
          fontSize: 35, 
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    SizedBox(height: 10,),
    Container(
      margin: EdgeInsets.only(right: 90), // Mengatur margin untuk jarak di bagian bawah
      child: Text(
        "Daftar Kost",
        style: TextStyle(
          fontSize: 20, 
          fontWeight: FontWeight.w500,
          color: Colors.black
        ),
      ),
    ),
  ],
),
                              DaftarKos(
                                imagePath: "assets/kos_1.jpg",
                                nameKos: "Kos Bahagia",
                                harga: "800k/bulan",
                                fasilitas: "Kamar mandi dalam, Wifi, Parkir, Dapur",
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DaftarKosDetail(
                                        imagePath: "assets/kos_1.jpg",
                                        nameKos: "Kos Bahagia",
                                        harga: "800k/bulan",
                                        fasilitas: "Kamar mandi dalam, Wifi, Parkir, Dapur",
                                        phoneNumber: "082136619175",
                                        deskripsi: "Kos ini sangat dekat dengan Universitas Tadulako, hanya berjarak 2 km. Kos ini merupakan kos putri dan kamar yang kosong ada 4.",
                                      ),
                                    ),
                                  );
                                },
                              ),
                              DaftarKos(
                                imagePath: "assets/kos_2.jpg",
                                nameKos: "Kos Sejahtera",
                                harga: "600k/bulan",
                                fasilitas: "Kamar mandi dalam, AC, Parkir, Laundry",
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DaftarKosDetail(
                                        imagePath: "assets/kos_2.jpg",
                                        nameKos: "Kos Sejahtera",
                                        harga: "600k/bulan",
                                        fasilitas: "Kamar mandi dalam, AC, Parkir, Laundry",
                                        phoneNumber: "082136619175",
                                        deskripsi: "Kos ini terletak dekat dengan pusat perbelanjaan. Terdapat fasilitas AC dan laundry. Harga sewa bulanan adalah 600k.",
                                      ),
                                    ),
                                  );
                                },
                              ),
                              DaftarKos(
                                imagePath: "assets/kos_3.jpg",
                                nameKos: "Kos Ibu Dewi",
                                harga: "550k/bulan",
                                fasilitas: "Kamar mandi dalam, AC, Wifi, CCTV, Parkir",
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DaftarKosDetail(
                                        imagePath: "assets/kos_3.jpg",
                                        nameKos: "Kos Ibu Dewi",
                                        harga: "650k/bulan",
                                        fasilitas: "Kamar mandi dalam, AC, Wifi, CCTV, Parkir",
                                        phoneNumber: "082136619175",
                                        deskripsi: "Kos ini memiliki lokasi yang sangat strategis, terletak hanya beberapa langkah dari pusat perbelanjaan di Kota Palu. Fasilitas yang tersedia mencakup AC untuk kenyamanan Anda sepanjang tahun, serta layanan laundry yang nyaman. Harga sewa bulanan yang terjangkau sebesar 650 ribu rupiah.",
                                      ),
                                    ),
                                  );
                                },
                              ),
                              DaftarKos(
                                imagePath: "assets/kos_4.jpg",
                                nameKos: "Kos Makmur",
                                harga: "700k/bulan",
                                fasilitas: "Kamar mandi dalam, AC, Wifi, Parkir, Gym",
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DaftarKosDetail(
                                        imagePath: "assets/kos_4.jpg",
                                        nameKos: "Kos Makmur",
                                        harga: "800k/bulan",
                                        fasilitas: "Kamar mandi dalam, AC, Wifi, Parkir, Gym",
                                        phoneNumber: "082136619175",
                                        deskripsi: "Kos ini menawarkan kamar-kamar yang nyaman dengan fasilitas kamar mandi dalam. Tidak perlu khawatir tentang cuaca panas karena setiap kamar dilengkapi dengan AC untuk menjaga suhu tetap nyaman. Tersedia layanan WiFi yang dapat Anda gunakan untuk pekerjaan atau hiburan online. Untuk kendaraan pribadi, tersedia fasilitas parkir yang aman. Harga sewa bulanan yang sangat terjangkau, yaitu 800 ribu rupiah.",
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ]
                          ),
                        ),
                      ),     
                    );
                   }
                  }