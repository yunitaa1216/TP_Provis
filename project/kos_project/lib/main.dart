import 'package:flutter/material.dart';
import 'package:kos_project/view/login_page.dart';
import 'package:kos_project/view/pemesanan.dart';
import 'package:kos_project/view/splash.dart';
import 'package:kos_project/view/tambahdata.dart';
import 'package:kos_project/view_model/userProvider.dart';import 'package:provider/provider.dart';
import 'package:kos_project/view/home_page.dart';
import 'package:kos_project/view_model/daftarkosdetailprovider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => DaftarKosDetailProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => WelcomeScreen(),
        '/Login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/pemesanan': (context) => PemesananPage(),
        '/add':(context) => AddData()
      },
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.brown,
      ),
    );
  }
}