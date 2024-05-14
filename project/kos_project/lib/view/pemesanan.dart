import 'package:flutter/material.dart';
import 'package:kos_project/models/user_model.dart';
import 'package:kos_project/view_model/user_repository.dart';

class PemesananPage extends StatefulWidget {
  const PemesananPage({Key? key}) : super(key: key);

  @override
  State<PemesananPage> createState() => _PemesananPageState();
}

class _PemesananPageState extends State<PemesananPage> {
  Repository repository = Repository();

  Future<List<User>?> fetchData() async {
    try {
      return await repository.getData();
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riwayat Pemesanan", style: TextStyle(color: Colors.black)),
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
      body: FutureBuilder<List<User>?>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data != null && snapshot.data is List<User>) {
            List<User> listUser = snapshot.data!;
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.of(context).popAndPushNamed(
                                  '/add',
                                  arguments: [
                                    listUser[index].id,
                                    listUser[index].name,
                                    listUser[index].no_hp,
                                    listUser[index].nama_kos,
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listUser[index].name,
                                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.black),
                                    ),
                                    Text(
                                      listUser[index].no_hp,
                                      style: TextStyle(fontSize: 16, color: Colors.black),
                                    ),
                                    Text(
                                      listUser[index].nama_kos,
                                      style: TextStyle(fontSize: 16, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () => Navigator.of(context).popAndPushNamed(
                                      '/add',
                                      arguments: [
                                        listUser[index].id,
                                        listUser[index].name,
                                        listUser[index].no_hp,
                                        listUser[index].nama_kos,
                                      ],
                                    ),
                                    icon: Icon(Icons.edit, color: Colors.black),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      bool shouldDelete = await showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Konfirmasi Penghapusan"),
                                            content: Text("Anda yakin ingin menghapus data ini?"),
                                            actions: <Widget>[
                                              TextButton(
                                                child: Text("Batal"),
                                                onPressed: () {
                                                  Navigator.of(context).pop(false);
                                                },
                                              ),
                                              TextButton(
                                                child: Text("Ya, Hapus"),
                                                onPressed: () {
                                                  Navigator.of(context).pop(true);
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      if (shouldDelete == true) {
                                        bool response = await repository.deleteData(listUser[index].id);
                                        if (response) {
                                          print('Berhasil menghapus data');
                                        } else {
                                          print('Gagal menghapus data');
                                        }
                                        setState(() {});
                                      }
                                    },
                                    icon: Icon(Icons.delete, color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: listUser.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/add');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown,
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Pesan Kos',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}