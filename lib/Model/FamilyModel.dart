class FamilyModel {
  String familyname;
  FamilyModel({this.familyname});

  Map<String, dynamic> toMap() {
    return {
      'familyname': familyname,
    };
  }

  static FamilyModel fromMap(Map<String, dynamic> json) {
    return FamilyModel(
      familyname: json['familyname'],
    );
  }
}
