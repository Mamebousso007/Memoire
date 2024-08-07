import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:testememo/collectionfemme.dart';
import 'package:testememo/collectionhommes.dart';
import 'package:testememo/enfant.dart';
import 'package:testememo/produit.dart';

import 'details.dart';

class Boutique extends StatefulWidget {
  const Boutique({Key? key}) : super(key: key);

  @override
  State<Boutique> createState() => _BoutiqueState();
}

class _BoutiqueState extends State<Boutique> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFFBB9B9)),
        title: Text("Boutique",
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

      body: CustomScrollView(
          slivers: [
              SliverToBoxAdapter(
                child:  Container(
                  //  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                  ),
                  //color: Colors.grey.shade50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color(0xFFFEF7FD),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 15.0,
                              spreadRadius: 5.0,
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                            )
                          ],
                        ),
                        child: Center(
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(
                                   Icons.pregnant_woman_outlined,
                                    size: 35,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => collectionfemme(),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "Femmes",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 8,
                      ),

                      Container(
                        padding: const EdgeInsets.all(5.0),
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color(0xFFFEF7FD),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 15.0,
                              spreadRadius: 5.0,
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                            )
                          ],
                        ),
                        child: Center(
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.man,
                                    size: 35,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Collectionhommes(),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "Hommes",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),

                      Container(
                        padding: const EdgeInsets.all(5.0),
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color(0xFFFEF7FD),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 15.0,
                              spreadRadius: 5.0,
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                            )
                          ],
                        ),
                        child: Center(
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.baby_changing_station,
                                    size: 35,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Couple(),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "Enfant",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    // Texte principal avec ombre
                    Text(
                      'Tendances Recente',
                      style: TextStyle(
                        color: Color(0xFFFBB9B9), // Couleur principale
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    // Texte avec reflet (plus clair)

                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('Produits').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {

                    return CircularProgressIndicator();
                  }

                  final produits = snapshot.data!.docs.map((doc) {
                    final data = doc.data() as Map<String, dynamic>;

                    final id = data['id'] as String?;
                    final nom = data['nom'] as String?;
                    final description = data['description'] as String?;
                    final prixvente = (data['prixvente'] ?? 0.0) as num;
                    final image = data['image'] as String?;
                    final categorie = data['categorie'] as String?;
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
                  }).toList();

                  return  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.docs[index].data() as Map<String, dynamic>;

                      String id = data['id'] ?? '';
                      String nom = data['nom'] ?? 'Nom inconnu';
                      num prix = data['prixvente'] ?? 0;
                      String imageUrl = data['image'] ?? 'https://via.placeholder.com/150'; // URL par défaut si aucune image n'est trouvée
                      String description = data['description'] ?? '';
                      String taille = data['taille'] ?? '';
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Detailsproduits(
                              id: id,
                              imageUrl: imageUrl,
                              nom: nom,
                              prix: prix,
                              description: description,
                              taille: taille,
                              // Ajoutez d'autres paramètres selon votre modèle Produit
                            ),
                          ));
                        },
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(
                                child: Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      nom,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '${prix.toString()} FCFA',
                                      style: TextStyle(
                                        color: Color(0xFFFBB9B9),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );


                  /*Container(
                      height: MediaQuery.of(context).size.height,
                      child: CustomScrollView(
                        slivers: [
                          SliverGrid(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Deux éléments par ligne
                              childAspectRatio: 0.7, // Rapport hauteur/largeur des éléments
                            ),
                            delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                final produit = produits[index];
                                return Card(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) {
                                            return Builder(
                                              builder: (context) {
                                                // Ici, context contient le fournisseur
                                                return Detailsproduits(
                                                  id: produit.id,
                                                  taille: produit.taille,
                                                  imageUrl: produit.image,
                                                  nom: produit.nom,
                                                  description: produit.description,
                                                  prix: produit.prixvente,
                                                );
                                              },
                                            );
                                          },
                                        ));
                                      },


                                      child: Column(
                                        children: [
                                          Container(
                                            width: 120, // Largeur de l'image
                                            height: 110, // Hauteur de l'image
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Image.network(
                                              produit.image,
                                              width: 120,
                                              height: 110,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(produit.nom, style: TextStyle(fontWeight: FontWeight.bold)),
                                          SizedBox(height: 5),
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children:[
                                                Text("Prix: "),
                                                Text('${produit.prixvente} FCFA',style: TextStyle(color: Colors.red),)
                                              ]
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Icon(
                                                  Icons.arrow_forward,
                                                  size: 20,
                                                  color: Color(0xFFEC729C),
                                                ),
                                                Text("Détails")
                                              ]

                                          ),


                                        ],
                                      ),
                                    )

                                  *//*ListTile(
                                        leading: Image.network(
                                          produit.image,
                                          width: 90,
                                          height: 90,
                                          fit: BoxFit.cover,
                                        ),
                                        title: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(produit.nom, style: TextStyle(fontWeight: FontWeight.bold)),
                                            Text('Prix : ${produit.prixvente} FCFA'),
                                          ],
                                        ),
                                        subtitle: Text("Détails"),
                                        onTap: () {
                                          // Ajoutez ici le code pour gérer le clic sur un élément
                                        },
                                      ),*//*

                                );
                              },
                              childCount: produits.length, // Nombre total d'éléments dans la liste
                            ),
                          ),
                        ],
                      )




                  )*/
                  ;
                },
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
        ),



    );
  }
}
