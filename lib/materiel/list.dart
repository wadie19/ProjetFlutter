import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_with_signup/Model/FamilyModel.dart';
import 'package:login_with_signup/compl/Familycompl.dart';
import 'package:login_with_signup/Model/materielModel.dart';
import 'package:login_with_signup/compl/MaterielCompl.dart';

class ListMaterial extends StatefulWidget {
  const ListMaterial({Key key}) : super(key: key);

  @override
  State<ListMaterial> createState() => ListMaterialState();
}

class ListMaterialState extends State<ListMaterial> {
  TextEditingController textController = TextEditingController();
  String nomFamily;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      nomFamily = null;
                    });
                  },
                  child: const Text("Reset"),
              ),
              FutureBuilder(
                  future: Family.getAllFamily(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<FamilyModel>> snapshot) {
                    if (snapshot.hasData) {
                      return DropdownButton<String>(
                        value: nomFamily,
                        hint: const Text("Find materiel By family"),
                        style: const TextStyle(color: Colors.blue),
                        items: snapshot.data.map<DropdownMenuItem<String>>((e) {
                          return DropdownMenuItem<String>(
                            value: e.familyname,
                            child: Text(e.familyname),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            nomFamily = value;
                          });
                        },
                      );
                    } else {
                      return const Text("No Family");
                    }
                  }),
            ]),
            Expanded(
              child: FutureBuilder(
                  future: (nomFamily.isNotEmpty)
                      ? MaterielCmp.getMaterialByNomF(nomFamily)
                      : MaterielCmp.getAllMaterial(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<MaterielModel>> projectSnap) {
                    if (!projectSnap.hasData) {
                      return const Text("Unkown error");
                    }
                    return ListView.builder(
                        itemCount: projectSnap.data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Card(
                                elevation: 8,
                                margin: const EdgeInsets.all(24),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      leading: const Icon(Icons.shop_two, size: 48),
                                      title: Text(
                                          projectSnap.data[index].nomMateriel,
                                          style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600)),
                                      subtitle: Text(projectSnap.data[index].nomFamily,
                                          style: const TextStyle(
                                              fontSize: 24, color: Colors.black)),
                                    ),

                                      ],
                                    ),

                                ),

                            ],
                          );
                        });
                  }),
            )
          ],
        ));
  }
}
