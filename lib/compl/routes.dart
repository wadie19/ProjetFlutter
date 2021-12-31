import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_with_signup/Screens/LoginForm.dart';
import 'package:login_with_signup/family/listFa.dart';
import 'package:login_with_signup/family/add.dart';


Route homeRoutes(RouteSettings setting) {
   Widget page = LoginForm();
  switch (setting.name) {
    case '/family':
      //page =  Family();
      break;
    case '/material':
     // page = const MyMaterial();
      break;
  }
  return MaterialPageRoute<dynamic>(
    builder: (context) {
      return page;
    },
    settings: setting,
  );
}

Route familyRoute(RouteSettings setting) {
   Widget page =  ListF();
  switch (setting.name) {
    case '/addFamily':
      page = const Add();
      break;
    case '/listFamily':
      page = const ListF();
      break;
  }
  return MaterialPageRoute<dynamic>(
    builder: (context) {
      return page;
    },
    settings: setting,
  );
}


