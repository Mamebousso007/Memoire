import 'package:testememo/produit.dart';

import 'detailspanier.dart';

class Panier {
  final String id; // L'ID du panier
  List<Produit> produits = []; // Une liste des éléments dans le panier
  final num montantTotal;

  Panier({
    required this.id,
    required this.produits,
    required this.montantTotal,
  });
}
