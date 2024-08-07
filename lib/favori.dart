import 'package:testememo/produit.dart';

class Favoris {
  final String id;
  List<Produit> produits = [];


  Favoris({
    required this.id,
    required this.produits,

  });
}
