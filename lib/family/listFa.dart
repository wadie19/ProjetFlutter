import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_with_signup/Model/FamilyModel.dart';
import 'package:login_with_signup/compl/Familycompl.dart';

class ListF extends StatefulWidget {
  const ListF({Key key}) : super(key: key);
  @override
  State<ListF> createState() => _ListF();
}

class _ListF extends State<ListF> {
  String nomF;

  @override
  Widget build(BuildContext mycontext) {
    return FutureBuilder(
        future: Family.getAllFamily(),
        builder:
            (BuildContext context, AsyncSnapshot<List<FamilyModel>> projectSnap) {
          if (projectSnap.connectionState == ConnectionState.none ||
              !projectSnap.hasData) {
            return const Text("Error");
          }
          return ListView.builder(
              itemCount: projectSnap.data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Card(
                      elevation: 8,
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(Icons.album, size: 48),
                            title: Text(projectSnap.data[index].familyname,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                child: const Text('view material'),
                                onPressed: () {},
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              });
        });
  }
}
