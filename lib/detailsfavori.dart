class DetailsFavoris {
  final String id; // Identifiant unique pour l'élément du panier
  final String produitID;
  final String nom;
  final String image;


  DetailsFavoris({
    required this.id, // Utilisez un identifiant unique
    required this.produitID,
    required this.nom,
    required this.image,
  });

  // Conversion d'un objet en Map pour Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'produitID': produitID,
      'nom': nom,
      'image': image,
    };
  }

  // Création d'un objet à partir d'une Map (pour Firestore)
  factory DetailsFavoris.fromMap(Map<String, dynamic> map) {
    return DetailsFavoris(
      id: map['id'],
      produitID: map['produitID'],
      nom: map['nom'],
      image: map['image'],


    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DetailsFavoris && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
