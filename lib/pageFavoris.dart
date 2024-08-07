import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testememo/favorisModel.dart';

import 'details.dart';
import 'detailsfavori.dart';

class PageFavoris extends StatefulWidget {
  const PageFavoris({Key? key}) : super(key: key);

  @override
  State<PageFavoris> createState() => _PageFavorisState();
}

class _PageFavorisState extends State<PageFavoris> {

  Future<void> deleteFavoris(String favorisId) async {
    try {
      // Suppression du favori de Firestore
      await FirebaseFirestore.instance.collection('Favoris').doc(favorisId).delete();
      print('Favori supprimé avec succès');
    } catch (e) {
      print('Erreur lors de la suppression du favori : $e');
    }
  }


  void _showImageDialog(String imageUrl) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Image.network(imageUrl, width: double.infinity),
        actions: <Widget>[
          TextButton(
            child: Text("Fermer"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFFBB9B9)),
        //widget.apiRequest!.allitems![0].logo!??""
        title: Text("Favoris",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            )),
        actions: [
          Text("Logo", style: TextStyle(color: Colors.black),)
        ],
        centerTitle: true,
        backgroundColor: Color(0xFFFAF7F7),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Text("Mes Favoris",style: TextStyle(color: Color(0xFFFBB9B9)),),
            SizedBox(height: 20,),
            Expanded(
              child: FutureBuilder<List<DetailsFavoris>>(
                future: Favoris().recupererFavoris(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Erreur: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text('Aucun favori ajouté.');
                  } else {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final produit = snapshot.data![index];
                        return Card(
                          child: InkWell(
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
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.network(
                                  produit.image,
                                  width: MediaQuery.of(context).size.width / 2.2,
                                  height: MediaQuery.of(context).size.width / 2.2,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  child: Icon(
                                    Icons.favorite,
                                    color: Color(0xFFFBB9B9).withOpacity(0.7),
                                    size: 60,
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  right: 10,
                                  child: Text(
                                    produit.nom,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      backgroundColor: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )


                    ;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
