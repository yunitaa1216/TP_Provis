import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kos_project/models/user_model.dart';

class Repository{
  final _basUrl = 'https://65373c7fbb226bb85dd2f77c.mockapi.io/pemesanan';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_basUrl));

      if(response.statusCode == 200){
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<User> user = it.map((e) => User.fromJson(e)).toList();
        return user;
      }
    } catch(e) {
      print(e.toString()
      );
    }
  }

  Future postData(String name, String no_hp, String nama_kos) async {
    try {
      final response = await http.post(Uri.parse(_basUrl),
      body: {
        "name": name,
        "no_hp": no_hp,
        "nama_kos": nama_kos
      }
      );
      if(response.statusCode == 201){
        return true;
      }else{
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future putData(int id, String name, String no_hp, String nama_kos) async {
    try {
      final response = await http.put(Uri.parse(_basUrl + '/' + id.toString()),
      body: {
        "name": name,
        "no_hp": no_hp,
        "nama_kos": nama_kos
      }
      );
      if(response.statusCode == 200){
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteData(String id) async {
    try {
      final response = await http.delete(Uri.parse(_basUrl + '/' + id));
      if(response.statusCode == 200){
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}