import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/AllFunction/flushbar_function.dart';
import 'package:food_delivery/controllers/database_controllers/api_calls.dart';
import 'package:food_delivery/models/app_models.dart';
import 'all_uri.dart';

class DatabaseHandlerController extends ChangeNotifier {
  // ========== Categories Data =================
  // ==============
  List<CategoriesModel> _categorydata = [];
  List<CategoriesModel> get categorydata => _categorydata;
  setcategorydata(BuildContext context) async {
    await ApiHandler().getData(categoriesuri).then((value) {
      final snapshot = value['categories'];
      List<CategoriesModel> data =
          (snapshot as List).map((e) => CategoriesModel.fromJson(e)).toList();
      _categorydata = data;
      notifyListeners();
    }).onError((error, stackTrace) {
      print(error.toString());
      flushbarFunction(error.toString(), context);
    });
  }

  // ========== Meals Data =================
  // ==============
  List<MealsModel> _mealsdata = [];
  List<MealsModel> get mealsdata => _mealsdata;
  
  setMeals(BuildContext context) async {
    await ApiHandler().getData(mealsuri).then((value) {
      final db = value["meals"] as List;
      List<MealsModel> data = db.map((e) => MealsModel.fromJson(e)).toList();
      _mealsdata = data;
      notifyListeners();
    }).onError((error, stackTrace) {
      print(error.toString());
      Fluttertoast.showToast( msg: error.toString());
      // flushbarFunction(error.toString(), context);
    });
  }
}
