import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testememo/produit.dart';

import 'boutique.dart';
import 'details.dart';

class collectionfemme extends StatefulWidget {
  const collectionfemme({Key? key}) : super(key: key);

  @override
  State<collectionfemme> createState() => _collectionfemmeState();
}

class _collectionfemmeState extends State<collectionfemme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFFBB9B9)),
        //widget.apiRequest!.allitems![0].logo!??""
        title: Text("Collection Femmes",
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
            CarouselSlider(
              items: [
                Image.asset('images/img.png'),
                Image.asset('images/img1.png'),
                Image.asset('images/p1.png'),
              ],
              options: CarouselOptions(
                height: 110.0,
                initialPage: 0,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Texte principal avec ombre
                            Text(
                              'Honneur aux Femmes',
                              style: TextStyle(
                                color: Color(0xFFFBB9B9), // Couleur principale
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            // Texte avec reflet (plus clair)
                            Positioned(
                              top: 4, // Ajustez la position verticale du reflet
                              child: Text(
                                'Honneur aux Femmes',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.3), // Couleur de reflet (plus clair)
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                   /* SliverToBoxAdapter(
                      child: Container(
                        width: 1,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xA8554E4E),
                            ),
                          ),
                        ),
                      ),
                    )*/
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 20,
                      ),
                    ),
                  /*  SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // Nombre d'éléments par ligne
                        childAspectRatio: 0.7, // Rapport hauteur/largeur des éléments
                      ),
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          // Liste des noms de fichiers d'images dans vos assets
                          List<String> assetImages = [
                            'images/f1.png',
                            'images/c3.png',
                            'images/c4.png',
                            'images/f2.png',
                            'images/f3.png',
                            'images/f4.png',
                          ];

                          String assetImagePath = assetImages[index % assetImages.length];

                          return GestureDetector(
                          *//*  onTap: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => Detailsproduits(imageUrl: assetImagePath,),
                                ),
                                    (Route<dynamic> route) => true,
                              );
                            },*//*
                            child: Column(
                              children: [
                                Container(
                                  width: 120, // Largeur de l'image
                                  height: 110, // Hauteur de l'image
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(assetImagePath),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(height: 5), // Espace vertical entre les images et les textes
                                Text(
                                  "Taille Base",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45
                                  ),
                                ),
                                Text(
                                  "100 000",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFFF10808)
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        childCount: 30, // Le nombre total d'éléments
                      ),
                    ),*/

                    SliverToBoxAdapter(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection('Produits').snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {

                            return CircularProgressIndicator();
                          }

                          final produits = snapshot.data!.docs
                              .map((doc) {
                            final data = doc.data() as Map<String, dynamic>;
                            final categorie = data['categorie'] as String?;


                            if (categorie == "Femmes") {
                              final id = data['id'] as String?;
                              final nom = data['nom'] as String?;
                              final description = data['description'] as String?;
                              final prixvente = (data['prixvente'] ?? 0.0) as num;
                              final image = data['image'] as String?;
                              final stock = (data['stock'] ?? 0) as num;
                              final remise = (data['remise'] ?? 0.0) as num;
                              final taille = data['taille'] as String?;

                              return Produit(
                                id: id ?? '',
                                nom: nom ?? '',
                                description: description ?? '',
                                prixvente: prixvente,
                                image: image ?? '',
                                categorie: categorie ?? '',
                                stock: stock,
                                remise: remise,
                                taille: taille ?? '',
                              );
                            } else {
                              return null;
                            }
                          })
                              .where((produit) => produit != null)
                              .toList();

                          return Container(
                              height: MediaQuery.of(context).size.height,
                              child: CustomScrollView(
                                slivers: [
                                  SliverGrid(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, // Deux éléments par ligne
                                      childAspectRatio: 0.65,
                                      mainAxisSpacing: 10, 
                                      crossAxisSpacing: 10,
                                    ),
                                    delegate: SliverChildBuilderDelegate(
                                          (BuildContext context, int index) {
                                        final produit = produits[index];
                                        return Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Card(
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (context) => Detailsproduits(
                                                      imageUrl: produit?.image ?? "",  // Utilisez l'opérateur ? pour gérer les valeurs potentiellement nulles
                                                      nom: produit?.nom ?? "",
                                                      description: produit?.description ?? "",
                                                      prix: produit?.prixvente ?? 0.0,
                                                      id: produit?.id ?? "",
                                                      taille: produit?.taille?? "", // Vous pouvez également fournir une valeur par défaut au cas où prixvente serait nul
                                                    ),
                                                  ));
                                                },
                                          
                                          
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: 120, // Largeur de l'image
                                                      height: 130, // Hauteur de l'image
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10),
                                                      ),
                                                      child: Image.network(
                                                        produit?.image ?? "",
                                                        width: 120,
                                                        height: 110,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5),
                                                    Text(produit?.nom ?? "", style: TextStyle(fontWeight: FontWeight.bold)),
                                                    SizedBox(height: 5),
                                                    Text(
                                                      'Prix : ${produit?.prixvente ?? ""} FCFA',
                                                      style: TextStyle(
                                                        color: Color(0xFFFBB9B9), // Couleur rose pâle pour le prix
                                                      ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    Center(
                                                      child: Text(
                                                        "Détails",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black, // Couleur pour le texte "Détails"
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                          
                                              )
                                          
                                          
                                          
                                          ),
                                        );
                                      },
                                      childCount: produits.length, // Nombre total d'éléments dans la liste
                                    ),
                                  ),
                                ],
                              )




                          )
                          ;
                        },
                      ),
                    ),

                    SliverToBoxAdapter(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => Boutique(),
                            ),
                                (Route<dynamic> route) => true,
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 142,
                              height: 37,
                              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: Color(0xFFF00808),
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
                                    'Voir la Boutique',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 20,
                      ),
                    ),

                    SliverToBoxAdapter(
                      child:  Column(
                        children: [
                          Container(
                            width: 428,
                            height: 245,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(color: Color(0xFF262A33)),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 172,
                                  top: 170,
                                  child: SizedBox(
                                    width: 101,
                                    height: 19,
                                    child: Text(
                                      '78 631 61 32',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFFEBD7D7),
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 328,
                                  top: 129,
                                  child: SizedBox(
                                    width: 85,
                                    height: 19,
                                    child: Text(
                                      'Blog',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 135,
                                  top: 205,
                                  child: SizedBox(
                                    width: 192,
                                    height: 29,
                                    child: Text(
                                      'bousso007@gmail.com',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFFEBD7D7),
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: -20,
                                  top: 129,
                                  child: SizedBox(
                                    width: 164,
                                    height: 29,
                                    child: Text(
                                      'A propos',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 124,
                                  top: 64,
                                  child: Container(
                                    width: 195,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1,
                                          strokeAlign: BorderSide.strokeAlignCenter,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 147,
                                  top: 129,
                                  child: SizedBox(
                                    width: 164,
                                    height: 29,
                                    child: Text(
                                      'Nous Contacter',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 97,
                                    height: 43,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: Container(
                                            width: 97,
                                            height: 43,
                                            decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                                          ),
                                        ),
                                        Positioned(
                                          left: 12.70,
                                          top: 10.12,
                                          child: SizedBox(
                                            width: 70.44,
                                            height: 11.38,
                                            child: Text(
                                              'Logo',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
