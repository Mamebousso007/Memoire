import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remixicon/remixicon.dart';
import 'package:testememo/pagepanier.dart';

import 'commandes.dart';
import 'detailsfavori.dart';
import 'detailspanier.dart';
import 'favorisModel.dart';
import 'panierModel.dart';

class Detailsproduits extends StatefulWidget {
  const Detailsproduits({
    Key? key,
    required this.imageUrl,
    required this.nom,
    required this.description,
    required this.prix,
    required this.id,
    required this.taille,
  }) : super(key: key);

  final String imageUrl;
  final String nom;
  final String description;
  final num prix;
  final String id;
  final String taille;

  @override
  State<Detailsproduits> createState() => _DetailsproduitsState();
}



class _DetailsproduitsState extends State<Detailsproduits> {
  final List<String> tailles = ['S', 'M', 'L', 'XL', 'XXL', 'Sur mesure'];
  // Utilisez un ensemble (Set) pour stocker les tailles sélectionnées
  final Set<String> taillesSelectionnees = {};
  int quantite = 1;
  bool isFavorited = false;
  bool isClique = false;

  // La fonction pour afficher le dialogue de saisie des mesures
  void _showCustomSizeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        String customSize = ''; // Variable pour stocker la taille personnalisée
        return AlertDialog(
          title: Text('Entrez vos mesures'),
          content: TextField(
            onChanged: (value) {
              customSize = value; // Mise à jour de la taille personnalisée
            },
            decoration: InputDecoration(hintText: "Mesures (par exemple: 90cm, 60cm, 90cm)"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop(); // Fermer le dialogue
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                if (customSize.isNotEmpty) {
                  setState(() {
                    taillesSelectionnees.clear();
                    taillesSelectionnees.add(customSize); // Ajouter la taille personnalisée à la sélection
                  });
                }
                Navigator.of(context).pop(); // Fermer le dialogue
              },
            ),
          ],
        );
      },
    );
  }

  void ajouterAuxFavoris() {
    DetailsFavoris favori = DetailsFavoris(
      id: widget.id,  // Utilisez l'ID du produit
      nom: widget.nom,  // Nom du produit
      image: widget.imageUrl,
      produitID: '',  // URL de l'image du produit
    );

    // Logique pour ajouter le produit aux favoris
    // Vous pouvez utiliser Provider ou directement votre base de données Firestore
    final Favoris favoris = Provider.of<Favoris>(context, listen: false);
    favoris.ajouterAuxFavoris(favori);

    // Afficher un message de confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 8),
            Text('Produit ajouté aux favoris', style: TextStyle(color: Colors.white)),
          ],
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,  // Changer la couleur si vous le souhaitez
      ),
    );
  }

  void ajouterAuPanier() {
    String tailleSelectionnee;
    if (taillesSelectionnees.isNotEmpty) {
      tailleSelectionnee = taillesSelectionnees.first;
    } else {
      // Gérez le cas où aucune taille n'est sélectionnée (vous pouvez choisir une taille par défaut ou afficher un message d'erreur).
      return;
    }
    DetailsPanier produit = DetailsPanier(
      nom: widget.nom,
      prix: widget.prix,
      quantite: quantite,
      id: widget.id,
      produitID: '',
      image: widget.imageUrl,
      taille: tailleSelectionnee,
    );

    final Panier panier = Provider.of<Panier>(context, listen: false);
    Provider.of<Panier>(context, listen: false).incrementerPanier();

    int indexProduit = panier.produits.indexWhere((p) => p.id == produit.id);

    if (indexProduit != -1) {

    } else {
      panier.ajouterAuPanier(produit);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.check_circle, // Utilisez l'icône de coche verte (vous pouvez en choisir d'autres selon votre préférence)
                color: Colors.white, // Couleur de l'icône
              ),
              SizedBox(width: 8), // Ajoute un petit espace entre l'icône et le texte
              Text('Produit ajouté au panier', style: TextStyle(color: Colors.white)),
            ],
          ),
          
          duration: Duration(seconds: 2), // Réglez la durée d'affichage du message
          backgroundColor: Colors.green, // Couleur d'arrière-plan verte
        ),
      );

    }


    // Utilisez votre modèle de panier pour ajouter le produit
   // Panier().ajouterAuPanier(produit);

    // Vous pouvez également ajouter de la logique pour mettre à jour l'interface utilisateur ici
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFFBB9B9)),
        //widget.apiRequest!.allitems![0].logo!??""
        title: Text("Details produits",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            )),
        actions: [
          Consumer<Panier>(
            builder: (context, panier, child) {
              // Obtenir le nombre de produits dans le panier
              return Align(
                alignment: Alignment.center, // Ceci centre l'icône dans l'espace alloué
                child: Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.shopping_cart, size: 25, color: Color(0xFFFBB9B9),),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PagePanier(),
                          ),
                        );
                      },
                    ),
                    if (panier.nombreProduits > 0)
                      Positioned(
                        right: 8,
                        top: 8,
                        child: CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Text(
                            panier.nombreProduits.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ],
        centerTitle: true,
        backgroundColor: Color(0xFFFAF7F7),
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        width: 408,
                        height: 471,
                        child: Image.network(widget.imageUrl),
                      )
                      ,
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [

                          Text(
                            'Description',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          Text(
                            widget.description,
                            style: TextStyle(
                              color: Color(0xFF554E4E),
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          RichText(
                            text: TextSpan(


                              children: [
                                TextSpan(
                                  text: 'Prix: ',
                                  style: TextStyle(
                                    color: Color(0xFF554E4E),
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: '${widget.prix} FCFA', // Utilisez le prix du produit
                                  style: TextStyle(
                                    color: Color(0xFFFBB9B9),
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          )



                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 20,),
                    ),
                    SliverToBoxAdapter(
                      child: Align(
                        alignment: Alignment.topLeft,
                          child: Text("Choissisez votre taille",

                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          )
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var taille in tailles)
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.0),
                              child: CheckboxListTile(
                                title: Text(taille),
                                value: taillesSelectionnees.contains(taille),
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      if (value) {
                                        if (taille == 'Sur mesure') {
                                          // Affichez un dialogue pour entrer les mesures
                                          _showCustomSizeDialog();
                                        } else {
                                          taillesSelectionnees.clear();
                                          taillesSelectionnees.add(taille);
                                        }
                                      } else {
                                        taillesSelectionnees.remove(taille);
                                      }
                                    });
                                  }
                                },
                                activeColor: Color(0xFFFBB9B9), // Définissez la couleur de fond de la case ici
                                checkColor: Colors.white, // Couleur de la coche
                              ),
                            ),

                          // Autres éléments de votre page existante ici
                        ],
                      ),
                    ),

                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start, // Centrer horizontalement
                            children: [
                              Text("Quantite",style: TextStyle(fontSize: 20),),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 32, // Largeur du conteneur
                                height: 32, // Hauteur du conteneur
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle, // Forme circulaire
                                  color: Color(0xFFFBB9B9),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: IconButton(
                                    icon: Icon(Icons.remove),
                                    color: Colors.white, // Couleur de l'icône
                                    onPressed: () {
                                      setState(() {
                                        if (quantite > 1) {
                                          quantite--;
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                quantite.toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFFBB9B9),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: IconButton(
                                    icon: Icon(Icons.add),
                                    color: Colors.white, // Couleur de l'icône
                                    onPressed: () {

                                      setState(() {
                                        quantite++;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 20,),
                    ),
                    SliverToBoxAdapter(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavorited = !isFavorited;
                          });
                          ajouterAuxFavoris();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 77,
                              height: 39,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 77,
                                      height: 39,
                                      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: isFavorited ? Colors.white : Color(0xFFFBB9B9), // Couleur en fonction de l'état
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Center(
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.favorite,
                                            color: isFavorited ? Color(0xFFFBB9B9) : Colors.white, // Couleur en fonction de l'état
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              isFavorited = !isFavorited;
                                            });
                                          },
                                        ),
                                      ),
                                    )

                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isClique = !isClique;
                                });
                                ajouterAuPanier();
                              },
                              child: Container(
                                width: 223,
                                height: 39,
                                padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: isClique ? Colors.white : Color(0xFFFBB9B9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Ajouter au panier',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: isClique ? Color(0xFFFBB9B9) : Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )

                          ],
                        ),
                      )

                    )



                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
