import 'package:flutter/material.dart';

import 'DetailCommande.dart';
import 'commande.dart';

class DetailCommandePage extends StatelessWidget {
  final Commande commande;

  DetailCommandePage({required this.commande});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Détails de la commande"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Commande ID: ${commande.id}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Date de commande: ${commande.date}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Montant total: ",
              style: TextStyle(fontSize: 16),
            ),
            Center(
              child: Text(
                "${commande.montantTotal} FCFA",
                style: TextStyle(fontSize: 18,
                    color: Color(0xFFFBB9B9),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "Mode de livraison: ${commande.modeDeLivraison}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Mode de paiement: ${commande.modeDePaiement}",
              style: TextStyle(fontSize: 16),
            ),
            Divider(),
            Text(
              "Détails des produits:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: commande.details.length,
                itemBuilder: (context, index) {
                  DetailCommande detail = commande.details[index];
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          width: 170, // Largeur de l'image augmentée
                          height: 170, // Hauteur de l'image augmentée
                          padding: EdgeInsets.all(8),
                          child: Image.network(
                            detail.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                detail.nomProduit,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Quantité: ${detail.quantite}",
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                "Prix unitaire: ${detail.prixUnitaire} FCFA",
                                style: TextStyle(fontSize: 14, color: Color(0xFFFBB9B9)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}