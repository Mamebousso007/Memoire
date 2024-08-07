import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testememo/favorisModel.dart';
import 'package:testememo/panierModel.dart';

import 'package:testememo/svg.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyCvm4wIQxuhBcK4jL-bE60vScTcU8hfP90",
        authDomain: "gestion-commande2.firebaseapp.com",
        projectId: "gestion-commande2",
        storageBucket: "gestion-commande2.appspot.com",
        messagingSenderId: "115080539774",
        appId: "1:115080539774:web:4137928e55dcaa5ec8f22f"
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Panier()),
        ChangeNotifierProvider(create: (_) => Favoris()),
        // Autres providers
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      /*theme: ThemeData(
        primarySwatch: Colors.green,
      ),*/
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    accueil(
                )
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:const Image(image: AssetImage("images/Connexion.png"),)
    );
  }
}
