import 'package:flutter/material.dart';
import 'package:login_with_signup/Model/FamilyModel.dart';
import 'package:login_with_signup/compl/Familycompl.dart';

class Add extends StatefulWidget {
  const Add({Key key}) : super(key: key);
  @override
  State<Add> createState() => _MyFamilyState();
}

class _MyFamilyState extends State<Add> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String nomFamily;

  @override
  Widget build(BuildContext mycontext) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter name',
            ),
            validator: (String value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }

              setState(() {
                nomFamily = value;
              });
            },
          ),
          ElevatedButton(
            child: const Text('add'),
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                bool state =
                  await Family.add(FamilyModel(familyname: nomFamily));
                //await MyDialog.fullDialog(
                //    context, state ? "INSERT SUCCESS" : "FAMILY EXISTS");
                Family.getAllFamily();
                if (state) {
                  Navigator.pushNamed(context, '/listFamily');
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
