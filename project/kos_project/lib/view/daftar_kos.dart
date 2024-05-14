import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kos_project/view_model/daftarkosdetailprovider.dart';

class DaftarKos extends StatelessWidget {
  final String imagePath;
  final String nameKos;
  final String harga;
  final String fasilitas;
  final VoidCallback onPressed;

  const DaftarKos(
      {Key? key,
      required this.imagePath,
      required this.nameKos,
      required this.harga,
      required this.fasilitas,
      required this.onPressed,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 160,
        child: Card(
          color: Color(0xFFEDDACF),
          margin: const EdgeInsets.only(right: 23, left: 23, bottom: 8, top: 8),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(imagePath, fit: BoxFit.cover)
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        nameKos,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        fasilitas,
                        style: const TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        harga,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5,), // Menambah jarak antara teks dan tombol Detail
            Row(
              mainAxisAlignment: MainAxisAlignment.start, // Menggeser tombol ke kiri
              children: [
                TextButton(
                  onPressed: onPressed,
                  child: Text(
                    "Detail", 
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            )
          ],
        ),
      ),
              ],
    ),
          ),
        )
  );
}
}