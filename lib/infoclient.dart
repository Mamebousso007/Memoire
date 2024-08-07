import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InfoClient extends StatefulWidget {
  @override
  _InfoClientState createState() => _InfoClientState();
}

class _InfoClientState extends State<InfoClient> {
  User? user = FirebaseAuth.instance.currentUser;
  DocumentSnapshot? userInfo;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    if (user != null) {
      var userDoc = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
      setState(() {
        userInfo = userDoc;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Center(child: Text('Informations du Client',style: TextStyle(fontSize: 14),)),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('URL_DE_L_IMAGE'),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text("Nom complet"),
              subtitle: Text('Nom: ${userInfo!['username']}', style: TextStyle(fontSize: 20)),
              leading: Icon(Icons.person),
              onTap: () {

              },
            ),
            Divider(),
            ListTile(
              title: Text("Email"),
              subtitle: Text('Email: ${userInfo!['email']}', style: TextStyle(fontSize: 20)),
              leading: Icon(Icons.email),
              onTap: () {

              },
            ),
            Divider(),
            ListTile(
              title: Text("Téléphone"),
              subtitle: Text('Telephone: ${userInfo!['Telephone']}', style: TextStyle(fontSize: 20)),
              leading: Icon(Icons.phone),
              onTap: () {

              },
            ),
            Divider(),
            ListTile(
              title: Text("Adresse"),
              subtitle: Text('Adresse: ${userInfo!['Adresse']}', style: TextStyle(fontSize: 20)),
              leading: Icon(Icons.location_on),
              onTap: () {

              },
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Fait par MDS",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
    /*return Scaffold(
      appBar: AppBar(
        title: Text('Informations du Client'),
      ),
      body: userInfo == null
          ? Center(child: CircularProgressIndicator())
          : Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nom: ${userInfo!['username']}', style: TextStyle(fontSize: 20)),
            Text('Email: ${userInfo!['email']}', style: TextStyle(fontSize: 20)),
            // Ajoutez d'autres champs d'information ici
          ],
        ),
      ),
    );*/
  }
}
