class MaterielModel {
  int id;
  String nomMateriel;
  int quantite;
  DateTime dateAcqui;
  String nomFamily;
  MaterielModel({
    this.id,
    this.nomMateriel,
    this.quantite,
    this.dateAcqui,
    this.nomFamily,
  });
  MaterielModel.create(this.nomMateriel, this.quantite, this.dateAcqui, this.nomFamily);

  Map<String, dynamic> toMap() {
    return {
      'nomMateriel': nomMateriel,
      'quantite': quantite,
      'dateAcquisition': dateAcqui.microsecondsSinceEpoch,
      'nomFamily': nomFamily,
    };
  }

  static MaterielModel fromMap(Map<String, dynamic> json) {
    return MaterielModel(
      id: json['id'],
      nomMateriel: json['nomMateriel'],
      quantite: json['quantite'],
      dateAcqui: DateTime.fromMicrosecondsSinceEpoch(json['dateAcquisition']),
      nomFamily: json['nomFamily'],
    );
  }
}
