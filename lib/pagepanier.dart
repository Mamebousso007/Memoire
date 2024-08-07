
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testememo/panierModel.dart';

import 'details.dart';
import 'detailspanier.dart';
import 'resumepanier.dart';

class PagePanier extends StatefulWidget {
  const PagePanier({Key? key}) : super(key: key);

  @override
  State<PagePanier> createState() => _PagePanierState();
}

class _PagePanierState extends State<PagePanier> {
/*  Future<void> deleteProductImage(String imageUrl) async {
    try {
      if (imageUrl != null) {
        final imageRef = FirebaseStorage.instance.refFromURL(imageUrl);
        await imageRef.delete();
        print('Image du produit supprimée avec succès');
      } else {
        print('L\'URL de l\'image est nulle.');
      }
    } catch (e) {
      print('Erreur lors de la suppression de l\'image : $e');
    }
  }

  Future<void> deleteProduct(String productId, String imageUrl) async {
    try {
      // Supprimez d'abord l'image du produit
      await deleteProductImage(imageUrl);

      // Ensuite, supprimez le produit de la base de données
      await FirebaseFirestore.instance.collection('Panier').doc(productId).delete();
      print('Produit supprimé avec succès');
    } catch (e) {
      print('Erreur lors de la suppression du produit : $e');
    }
  }*/
  Future<void> deleteProduct(String productId) async {
    try {
      // Suppression du produit du panier dans Firestore
      await FirebaseFirestore.instance.collection('Panier').doc(productId).delete();
      print('Produit supprimé avec succès du panier');

      // Mise à jour du compteur du panier
      Provider.of<Panier>(context, listen: false).decrementerPanier();
    } catch (e) {
      print('Erreur lors de la suppression du produit du panier : $e');
    }
  }


  double Montant = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFFBB9B9)),
        //widget.apiRequest!.allitems![0].logo!??""
        title: Text("Panier",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            )),
        actions: [
          Image(
            image: AssetImage("images/logo.jpg"),
            height: 40,
            width: 40,
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Text("Résumé du panier"),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: FutureBuilder<List<DetailsPanier>>(
                        future: Panier().recupererDonneesPanier(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Erreur: ${snapshot.error}');
                          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return Text('Le panier est vide.');
                          } else {
                            double montantTotal = 0.0;

                            // Calculez le montant total en parcourant les produits du panier
                            for (var produit in snapshot.data!) {
                              montantTotal += produit.prix * produit.quantite;
                              Montant = montantTotal;
                            }

                            return Column(
                              children: [

                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    final produit = snapshot.data![index];
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Detailsproduits(
                                              id: produit.id,
                                              nom: produit.nom,
                                              imageUrl: produit.image,
                                              prix: 0,
                                              description: '' ,
                                              taille: '',
                                            ),
                                          ),
                                        );
                                      },
                                      child: ListTile(
                                        leading: Image.network(produit.image, width: 100, height: 100),
                                        title: Text(produit.nom),
                                        subtitle: Text('Taille: ${produit.taille}, Quantité: ${produit.quantite}'),
                                        trailing: Column(
                                          children: [
                                            Text('${produit.prix} FCFA'),
                                            InkWell(
                                              child: Icon(Icons.delete, color: Colors.red.withOpacity(0.75)),
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Text("Confirmation de la suppression"),
                                                      content: Text("Voulez-vous vraiment supprimer ce produit ?"),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          child: Text("Annuler"),
                                                          onPressed: () {
                                                            Navigator.of(context).pop();
                                                          },
                                                        ),
                                                        TextButton(
                                                          child: Text("Supprimer"),
                                                          onPressed: () {
                                                            deleteProduct(produit.id);
                                                            Navigator.of(context).pop();
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 30,),
                                Text.rich(
                                  TextSpan(
                                    text: 'Montant Total: ',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '$montantTotal FCFA',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFFBB9B9)),
                                      ),
                                    ],
                                  ),
                                )

                              ],
                            );
                          }
                        },
                      ),
                    ),

                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),

                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResumePanier(
                                  Montant: Montant
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Commander',
                            style: TextStyle(fontSize: 24, color: Colors.white), // Augmenter la taille du texte
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFF68B73),
                            //minimumSize: Size(200, 50), // Ajustez la largeur (200) et la hauteur (50) comme vous le souhaitez
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        )

                      ),
                    ),



                  ],
                )
            )

          ],
        ),
      ),

    );
  }
}
