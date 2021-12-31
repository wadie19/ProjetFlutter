import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_with_signup/Model/FamilyModel.dart';
import 'package:login_with_signup/Model/materielModel.dart';
import 'package:login_with_signup/compl/Familycompl.dart';
import 'package:login_with_signup/compl/MaterielCompl.dart';
class AddMaterial extends StatefulWidget {
  const AddMaterial({Key key}) : super(key: key);
  @override
  State<AddMaterial> createState() => _MymatState();
}

class _MymatState extends State<AddMaterial> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String nomMateriel;
  int quant;
  DateTime dateAqui;
  String nomFamily;
  List<FamilyModel> allFamily;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext mycontext) {
    return Form(
        key: _formKey,
        child: FutureBuilder<List<FamilyModel>>(
          future: Family.getAllFamily(),
          builder:
              (BuildContext context, AsyncSnapshot<List<FamilyModel>> snapshot) {
            Widget mat;
            if (snapshot.hasData) {
              mat = DropdownButton<String>(
                value: nomFamily,
                icon: const Icon(Icons.add_alarm),
                hint: const Text("Choose Family"),
                style: const TextStyle(color: Colors.deepPurple),
                items: snapshot.data.map<DropdownMenuItem<String>>((e) {
                  return DropdownMenuItem<String>(
                    alignment: AlignmentDirectional.center,
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
              mat = const Text('unkown');
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter name',
                  ),
                  validator: (String value) {
                    if ( value.isEmpty) {
                      return 'Please enter some text';
                    }
                    setState(() {
                      nomMateriel = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter quantite',
                  ),
                  validator: (String value){
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    setState(() {
                      quant = int.parse(value);
                    });
                  },
                ),

                ElevatedButton(
                  child: const Text('add'),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      bool state = await MaterielCmp.add(MaterielModel.create(nomMateriel, quant, dateAqui, nomFamily));
                         }
                  },
                ),
              ],
            );
          },
        ));
  }
}
