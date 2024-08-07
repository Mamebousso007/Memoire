import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testememo/commande.dart';

import 'detailCommandePage.dart';

class Listecommandes extends StatefulWidget {
  const Listecommandes({Key? key}) : super(key: key);

  @override
  _ListecommandesState createState() => _ListecommandesState();
}

class _ListecommandesState extends State<Listecommandes> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Commande>> _recupererCommandes() async {
    try {
      var userId = _auth.currentUser!.uid;
      var snapshot = await _firestore.collection('commandes')
          .where('clientId', isEqualTo: userId)
          .get();
      return snapshot.docs.map((doc) => Commande.fromDocumentSnapshot(doc)).toList();
    } catch (e) {
      print("Erreur lors de la récupération des commandes: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes Commandes"),
      ),
      body: FutureBuilder<List<Commande>>(
        future: _recupererCommandes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Aucune commande trouvée."));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Commande commande = snapshot.data![index];
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text("Commande ${commande.id}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Date: ${commande.date.toLocal()}"), // Affiche la date locale
                      Text("Total: ${commande.montantTotal} FCFA", style: TextStyle(color: Color(0xFFFBB9B9))), // Total en rouge
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailCommandePage(commande: commande),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
