import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remixicon/remixicon.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:testememo/enfant.dart';
import 'package:testememo/pageFavoris.dart';
import 'package:testememo/pagepanier.dart';
import 'package:testememo/panierModel.dart';
import 'package:testememo/produit.dart';
import 'package:url_launcher/url_launcher.dart';

import 'boutique.dart';
import 'collectionfemme.dart';
import 'collectionhommes.dart';
import 'connexion.dart';
import 'details.dart';
import 'infoclient.dart';
import 'listecommande.dart';
import 'notification.dart';
class accueil extends StatefulWidget {
  const accueil({Key? key}) : super(key: key);

  @override
  State<accueil> createState() => _accueilState();
}

class _accueilState extends State<accueil> {
  int currentIndex = 0; // Index de l'élément sélectionné

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
    if (index == 1){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PageFavoris()));

    }
    if (index == 3){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => InfoClient()));

    }

    if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Listecommandes()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      'images/c1.png',
      'images/c2.png',
      'images/c3.png',
      'images/c4.png',
      'images/c5.png',
    ];

    return Scaffold(
          drawer: Drawer(
                elevation: 0,
                backgroundColor: Color(0xFFF3F3F3),
                child: ListView(
                  padding: const EdgeInsets.all(0),
                  children: [
                    const DrawerHeader(
                      child: Image(
                        image: AssetImage("images/logo.jpg"),
                        height: 53,
                        width: 119,
                      ),
                      decoration: BoxDecoration(color: Colors.white),
                    ),

                    Container(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Listecommandes()));
                            },
                            child: ListTile(
                              leading: Icon(Remix.file_list_2_line,
                                  size: 25, color: Colors.black),
                              title: Text(
                                "Liste Commandes",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto'),
                              ),
                              trailing: Icon(
                                Icons.arrow_circle_right_outlined,
                                color: Color(0xFFFBB9B9),
                                size: 14,
                              ),
                            ),
                          ),


                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Notifications()));
                            },
                            child: ListTile(
                              leading: Icon(Remix.notification_2_line,
                                  size: 25, color: Colors.black),
                              title: Text(
                                "Notifications",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto'),
                              ),
                              trailing: Icon(
                                Icons.arrow_circle_right_outlined,
                                color: Color(0xFFFBB9B9),
                                size: 14,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => PageFavoris()));
                            },
                            child: ListTile(
                              leading: Icon(Icons.favorite_outline_rounded,
                                  size: 25, color: Colors.black),
                              title: Text(
                                "Mes Favoris",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto'),
                              ),
                              trailing: Icon(
                                Icons.arrow_circle_right_outlined,
                                color: Color(0xFFFBB9B9),
                                size: 14,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Boutique()));
                            },
                            child: ListTile(
                              leading: Icon(Remix.store_2_fill,
                                  size: 25, color: Colors.black),
                              title: Text(
                                "Boutiques",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto'),
                              ),
                              trailing: Icon(
                                Icons.arrow_circle_right_outlined,
                                color: Color(0xFFFBB9B9),
                                size: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Container(
                            width: 280,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFFFBB9B9),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => InfoClient()));
                            },
                            child: ListTile(
                              leading: Icon(Remix.settings_2_fill,
                                  size: 25, color: Colors.black),
                              title: Text(
                                "Parametres",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto'),
                              ),
                              trailing: Icon(
                                Icons.arrow_circle_right_outlined,
                                color: Color(0xFFFBB9B9),
                                size: 14,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Connexion()));
                            },
                            child: ListTile(
                              leading: Icon(Remix.login_box_line,
                                  size: 25, color: Colors.black),
                              title: Text(
                                "Se Connecter",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto'),
                              ),
                              trailing: Icon(
                                Icons.arrow_circle_right_outlined,
                                color: Color(0xFFFBB9B9),
                                size: 14,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
          ),
          appBar: AppBar(
        leading: Builder(
          builder: (context) => // Ensure Scaffold is in context
          IconButton(
              icon: Icon(
                Remix.menu_2_fill,
                color: Color(0xFFFBB9B9),
              ),
              onPressed: () => Scaffold.of(context).openDrawer()),
        ),
        //widget.apiRequest!.allitems![0].logo!??""
        title: Text("Accueil",
            style: TextStyle(
              color: Colors.grey,
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




              IconButton(
                icon: Icon(Icons.search, size: 20, color: Colors.black45,), // Icône de recherche
                onPressed: () {
                },
              ),
            ],

            centerTitle: true,
        backgroundColor: Color(0xFFFAF7F7),
        elevation: 0,
      ),
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String whatsappNumber = "+221786316132";
          final String url = "https://api.whatsapp.com/send?phone=$whatsappNumber";

          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        backgroundColor: Color(0xFF25D366), // Couleur WhatsApp
        child: Icon(Remix.whatsapp_line,color: Colors.white,), // Image WhatsApp
      ),
      drawerEnableOpenDragGesture: false,
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
                          margin: EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            strutStyle: StrutStyle(fontSize: 12.0),
                            text: TextSpan(
                              //style: GoogleFonts.roboto(color: indexs==0 ?Palette.color4:Palette.colorBlack),
                              style: TextStyle(
                                  color: Color(0xFF564E4E), fontWeight: FontWeight.w600),
                              text: "Nouveautés",
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          height: 205.0,

                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Produits')
                                .orderBy('id', descending: true)
                                .limit(5)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Center(child: CircularProgressIndicator());
                              }

                              if (!snapshot.hasData) {
                                return Center(child: Text('Aucune donnée trouvée.'));
                              }

                              List<Produit> produits = snapshot.data!.docs.map((doc) {
                                return Produit.fromMap(doc.data() as Map<String, dynamic>);
                              }).toList();

                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: produits.length,
                                itemBuilder: (context, index) {
                                  Produit produit = produits[index];
                                  return Container(
                                    width: 110,
                                    margin: EdgeInsets.only(right: 15),
                                    child: Card(
                                      elevation: 4,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => Detailsproduits(
                                              id: produit.id,
                                              imageUrl: produit.image,
                                              nom: produit.nom,
                                              prix: produit.prixvente,
                                              description: produit.description,
                                              taille: produit.taille,
                                              // Ajoutez d'autres paramètres selon votre modèle Produit
                                            ),
                                          ));
                                        },
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Image.network(
                                                produit.image,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    produit.nom,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    '${produit.prixvente} FCFA',
                                                    style: TextStyle(
                                                      color: Color(0xFFFBB9B9),
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        )
                        ,
                      ),

                      SliverToBoxAdapter(
                        child:  SizedBox(
                          height: 10,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            strutStyle: StrutStyle(fontSize: 12.0),
                            text: TextSpan(
                              //style: GoogleFonts.roboto(color: indexs==0 ?Palette.color4:Palette.colorBlack),
                              style: TextStyle(
                                  color: Color(0xFF564E4E), fontWeight: FontWeight.w600),
                              text: "Collections Femmes",
                            ),
                          ),
                        ),
                      ),

                     SliverToBoxAdapter(
                       child:  SizedBox(
                         height: 10,
                       ),
                     ),

                      // À l'intérieur de votre widget CustomScrollView

                      SliverToBoxAdapter(
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('Produits').limit(6)
                              .where('categorie', isEqualTo: 'Femmes') // Filtrer les produits par catégorie
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }

                            if (!snapshot.hasData) {
                              return Center(child: Text("Aucune donnée trouvée."));
                            }

                            List<Produit> produits = snapshot.data!.docs.map((doc) {
                              return Produit.fromMap(doc.data() as Map<String, dynamic>);
                            }).toList();

                            return GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(), // Important pour éviter les conflits de défilement
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.8,
                              ),
                              itemCount: produits.length,
                              itemBuilder: (context, index) {
                                final produit = produits[index];
                                return Container(
                                  width: 110,
                                  margin: EdgeInsets.only(right: 15),
                                  child: Card(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => Detailsproduits(
                                            id: produit.id,
                                            imageUrl: produit.image,
                                            nom: produit.nom,
                                            prix: produit.prixvente,
                                            description: produit.description,
                                            taille: produit.taille,
                                            // Ajoutez d'autres paramètres selon votre modèle Produit
                                          ),
                                        ));
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Image.network(
                                              produit.image,
                                              width: double.infinity, // Prend toute la largeur disponible
                                              fit: BoxFit.cover, // Remplit l'espace tout en conservant les proportions
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  produit.nom,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                  overflow: TextOverflow.ellipsis, // Ajoute des points de suspension si le texte est trop long
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  'Prix : ${produit.prixvente} FCFA',
                                                  style: TextStyle(
                                                    color: Color(0xFFFBB9B9),
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                // Ajouter d'autres informations sur le produit si nécessaire
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),


                      SliverToBoxAdapter(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => collectionfemme(),
                              ),
                                  (Route<dynamic> route) => true,
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 5,
                              bottom: 5,
                            ),
                            alignment: Alignment.centerRight, // Aligner le contenu à droite
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              strutStyle: StrutStyle(fontSize: 12.0),
                              text: TextSpan(
                                style: TextStyle(
                                  color: Color(0xFF564E4E),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Inter",
                                  fontStyle: FontStyle.italic,
                                ),
                                text: "Voir plus...",
                              ),
                            ),
                          ),
                        ),
                      ),



                      SliverToBoxAdapter(
                        child:  SizedBox(
                          height: 10,
                        ),
                      ),

                      SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            strutStyle: StrutStyle(fontSize: 12.0),
                            text: TextSpan(
                              //style: GoogleFonts.roboto(color: indexs==0 ?Palette.color4:Palette.colorBlack),
                              style: TextStyle(
                                  color: Color(0xFF564E4E), fontWeight: FontWeight.w600),
                              text: "Collections Hommes",
                            ),
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(
                        child:  SizedBox(
                          height: 10,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('Produits').limit(6)
                              .where('categorie', isEqualTo: 'Hommes') // Filtrer les produits par catégorie
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }

                            if (!snapshot.hasData) {
                              return Center(child: Text("Aucune donnée trouvée."));
                            }

                            List<Produit> produits = snapshot.data!.docs.map((doc) {
                              return Produit.fromMap(doc.data() as Map<String, dynamic>);
                            }).toList();

                            return GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(), // Important pour éviter les conflits de défilement
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.8,
                              ),
                              itemCount: produits.length,
                              itemBuilder: (context, index) {
                                final produit = produits[index];
                                return Container(
                                  width: 110,
                                  margin: EdgeInsets.only(right: 15),
                                  child: Card(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => Detailsproduits(
                                            id: produit.id,
                                            imageUrl: produit.image,
                                            nom: produit.nom,
                                            prix: produit.prixvente,
                                            description: produit.description,
                                            taille: produit.taille,
                                            // Ajoutez d'autres paramètres selon votre modèle Produit
                                          ),
                                        ));
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Image.network(
                                              produit.image,
                                              width: double.infinity, // Prend toute la largeur disponible
                                              fit: BoxFit.cover, // Remplit l'espace tout en conservant les proportions
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  produit.nom,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                  overflow: TextOverflow.ellipsis, // Ajoute des points de suspension si le texte est trop long
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  'Prix : ${produit.prixvente} FCFA',
                                                  style: TextStyle(
                                                    color: Color(0xFFFBB9B9),
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                // Ajouter d'autres informations sur le produit si nécessaire
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),

                      SliverToBoxAdapter(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => Collectionhommes(),
                              ),
                                  (Route<dynamic> route) => true,
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 5,
                              bottom: 5,
                            ),
                            alignment: Alignment.centerRight, // Aligner le contenu à droite
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              strutStyle: StrutStyle(fontSize: 12.0),
                              text: TextSpan(
                                style: TextStyle(
                                  color: Color(0xFF564E4E),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Inter",
                                  fontStyle: FontStyle.italic,
                                ),
                                text: "Voir plus...",
                              ),
                            ),
                          ),
                        ),
                      ),



                      SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            strutStyle: StrutStyle(fontSize: 12.0),
                            text: TextSpan(
                              //style: GoogleFonts.roboto(color: indexs==0 ?Palette.color4:Palette.colorBlack),
                              style: TextStyle(
                                  color: Color(0xFF564E4E), fontWeight: FontWeight.w600),
                              text: "Collections Enfants",
                            ),
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(
                        child:  SizedBox(
                          height: 10,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('Produits').limit(6)
                              .where('categorie', isEqualTo: 'Enfants') // Filtrer les produits par catégorie
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }

                            if (!snapshot.hasData) {
                              return Center(child: Text("Aucune donnée trouvée."));
                            }

                            List<Produit> produits = snapshot.data!.docs.map((doc) {
                              return Produit.fromMap(doc.data() as Map<String, dynamic>);
                            }).toList();

                            return GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(), // Important pour éviter les conflits de défilement
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.8,
                              ),
                              itemCount: produits.length,
                              itemBuilder: (context, index) {
                                final produit = produits[index];
                                return Container(
                                  width: 110,
                                  margin: EdgeInsets.only(right: 15),
                                  child: Card(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => Detailsproduits(
                                            id: produit.id,
                                            imageUrl: produit.image,
                                            nom: produit.nom,
                                            prix: produit.prixvente,
                                            description: produit.description,
                                            taille: produit.taille,
                                            // Ajoutez d'autres paramètres selon votre modèle Produit
                                          ),
                                        ));
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Image.network(
                                              produit.image,
                                              width: double.infinity, // Prend toute la largeur disponible
                                              fit: BoxFit.cover, // Remplit l'espace tout en conservant les proportions
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  produit.nom,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                  overflow: TextOverflow.ellipsis, // Ajoute des points de suspension si le texte est trop long
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  'Prix : ${produit.prixvente} FCFA',
                                                  style: TextStyle(
                                                    color: Color(0xFFFBB9B9),
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                // Ajouter d'autres informations sur le produit si nécessaire
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),

                      SliverToBoxAdapter(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => Couple(),
                              ),
                                  (Route<dynamic> route) => true,
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 5,
                              bottom: 5,
                            ),
                            alignment: Alignment.centerRight, // Aligner le contenu à droite
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              strutStyle: StrutStyle(fontSize: 12.0),
                              text: TextSpan(
                                style: TextStyle(
                                  color: Color(0xFF564E4E),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Inter",
                                  fontStyle: FontStyle.italic,
                                ),
                                text: "Voir plus...",
                              ),
                            ),
                          ),
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
                                  color: Color(0xFFFBB9B9),
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
                          height: 15,
                        ),
                      ),
                      /*SliverToBoxAdapter(
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
                      )*/


                    ],
                  )
              ),
           ]
        ),
    ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_rounded, color: Colors.black),
            label: 'fav',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFFBB9B9).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Icon(Icons.home, color: Color(0xFFFBB9B9)),
            ),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info, color: Colors.black),
            label: 'info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined, color: Colors.black),
            label: '',
          ),
        ],
      ),

    );
  }
}
