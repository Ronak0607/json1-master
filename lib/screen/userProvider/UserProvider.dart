import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:json/screen/userModel/Productmodel.dart';
import 'package:json/screen/userModel/UserModel.dart';

class UserProvider extends ChangeNotifier {

  List jsonList =[];
  List<dynamic> finalList = [];

  getUserData() async {
    String jsonFile = await rootBundle.loadString("assets/json/data.json");
    var json = jsonDecode(jsonFile);

    finalList = json.map((e) => Productmodel.fromJson(e)).toList();

    notifyListeners();
  }
}
