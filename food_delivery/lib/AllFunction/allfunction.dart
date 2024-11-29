import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/all_controllers.dart';
import 'package:food_delivery/controllers/database_controller.dart';
import 'package:food_delivery/models/app_models.dart';
import 'package:provider/provider.dart';

class AllFunction {
//  login Function -------------------
// ------------------
  login(String mobilenumber, String password, BuildContext context) async {
    final providerdata = Provider.of<AllControllers>(context, listen: false);
    final db = await getjsondata("login_json.json");
    final useremaildata = db.where((e) => e["mobilenumber"] == mobilenumber);
    useremaildata.first["password"] == password;
    final userdata = UserModel.fromjson(useremaildata.first);
    providerdata.getuserdata(userdata);
  }

//  Items Function -------------------
// ------------------
  items(BuildContext context) async {
    final providerdata = Provider.of<AllControllers>(context, listen: false);
    providerdata.setLoading(true);
    final db = await getjsondata("menu_json.json");
    final itemsdata = db.map((e) => ItemModel.fromJson(e)).toList();
    providerdata.getitemdata(itemsdata);
    providerdata.setLoading(false);
  }

//  Category Function -------------------
// ------------------
  category(BuildContext context) async {
    final providerdata = Provider.of<AllControllers>(context, listen: false);
    final db = await getjsondata("category_json.json");
    final categorydata = db.map((e) => CategoryModel.fromJson(e)).toList();
    providerdata.getcategorydata(categorydata);
  }

//  Restaurant Function -------------------
// ------------------
  restaurantFunction(BuildContext context) async {
    final providerdata = Provider.of<AllControllers>(context, listen: false);
    final db = await getjsondata("restaurant_json.json");
    final restaurantdata = db.map((e) => RestaurantModel.fromJson(e)).toList();
    providerdata.getRestaurantdata(restaurantdata);
  }

//  Order Function -------------------
// ------------------
  Future<bool> orderFunction(BuildContext context) async {
    final providerdata = Provider.of<AllControllers>(context, listen: false);
    final db = await getjsondata("orderhistory_json.json");
    final orderdata = db.map((e) => OrderModel.fromJson(e)).toList();
    providerdata.getOrderdata(orderdata);
    return true;
  }

  //  Discount Function -------------------
  // ------------------
  discount(double discountvalue, int price) {
    var h = price * discountvalue / 100;
    var kk = price - h;
    return kk.toStringAsFixed(0);
  }
}
