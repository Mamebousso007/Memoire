import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'detailsfavori.dart';

class Favoris with ChangeNotifier {
  final List<DetailsFavoris> produits = [];
  CollectionReference _favorisCollection = FirebaseFirestore.instance.collection('Favoris');

  Future<void> ajouterAuxFavoris(DetailsFavoris produit) async {
    try {
      final newDocumentRef = _favorisCollection.doc();
      await newDocumentRef.set({
        'id': newDocumentRef.id,
        'nom': produit.nom,
        'produitID': produit.id,
        'image':produit.image
      });
      produits.add(produit);
      notifyListeners();
    } catch (e) {
      print('Erreur lors de l\'ajout aux favoris : $e');
    }
  }

  bool estFavori(DetailsFavoris produit) {
    return produits.contains(produit);
  }

  Future<void> recupererFavorisEtMettreAJour() async {
    final produitsRecuperes = await recupererFavoris();
    produits.clear();
    produits.addAll(produitsRecuperes);
    notifyListeners();
  }

  Future<List<DetailsFavoris>> recupererFavoris() async {
    try {
      final querySnapshot = await _favorisCollection.get();
      return querySnapshot.docs.map((doc) {
        return DetailsFavoris(
            nom: doc['nom'],
            id: doc['id'],
            produitID: '', // Vous pouvez le remplir si vous en avez besoin
            image: doc['image'],
        );
      }).toList();
    } catch (e) {
      print('Erreur lors de la récupération des favoris : $e');
      return [];
    }
  }

  Future<void> supprimerDesFavoris(String productId) async {
    try {
      await _favorisCollection.doc(productId).delete();
      produits.removeWhere((produit) => produit.id == productId);
      notifyListeners();
    } catch (e) {
      print('Erreur lors de la suppression du favori : $e');
    }
  }

  void viderFavoris() {
    produits.clear();
    notifyListeners();
  }
}
