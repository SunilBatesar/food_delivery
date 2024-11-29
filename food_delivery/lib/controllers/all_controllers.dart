import 'package:flutter/material.dart';
import 'package:food_delivery/models/app_models.dart';

class AllControllers extends ChangeNotifier {
  // ------------- Loading Handler --------
  // -----------------
  bool _isLoading = false;
  bool get getLoadingState => _isLoading;
  setLoading(bool state) {
    _isLoading = state;
    notifyListeners();
  }

  // ------------- Set User Data --------
  // -----------------
  dynamic _userdata;
  List<UserModel> get userdata => _userdata;
  getuserdata(UserModel model) {
    _userdata = model;
    notifyListeners();
  }

  // ------------- Items Data --------
  // -----------------
  List<ItemModel> _itemdata = [];
  List<ItemModel> get itemdata => _itemdata;
  getitemdata(List<ItemModel> model) {
    _itemdata = model;
    notifyListeners();
  }

  // ------------- Restaurant Data --------
  // -----------------
  List<RestaurantModel> _restaurantData = [];
  List<RestaurantModel> get restaurantData => _restaurantData;
  getRestaurantdata(List<RestaurantModel> model) {
    _restaurantData = model;
    notifyListeners();
  }

  // ------------- Order Data --------
  // -----------------
  List<OrderModel> _orderData = [];
  List<OrderModel> get orderdata => _orderData;
  getOrderdata(List<OrderModel> model) {
    _orderData = model;
    notifyListeners();
  }

  final List<OrderHistoryModel> _orderHistyory = [];
  List<OrderHistoryModel> get getOrderAgain => _orderHistyory;

  static List<OrderHistoryModel> initializeOrderHistory(AllControllers db) {
    List<OrderHistoryModel> data = [];
    for (var i = 0; i < db._orderData.length; i++) {
      OrderModel myItem = db._orderData[i];
      RestaurantModel myrestaurant = db._restaurantData.firstWhere(
          (element) => element.restaurantId == myItem.orderrestaurantid);
      List<ItemModel> myorderMenu = [];
      for (var j = 0; j < myItem.ordermenuidlist.length; j++) {
        var itemId = myItem.ordermenuidlist[j];
        myorderMenu.add(
            db._itemdata.firstWhere((element) => element.menuid == itemId));
      }

      data.add(OrderHistoryModel(myrestaurant, myorderMenu,
          double.parse(myItem.orderprice), myItem.ordertime));
    }
    return data;
  }

  // List<IngredientsItemModel> getIngredients(String itemId) {
  //   return _itemdata
  //       .firstWhere((element) => element.menuid == itemId)
  //       .ingredients;
  // }

  List<ItemModel> getviews(int view) =>
      _itemdata.where((e) => int.parse(e.views) <= view).toList();

  // --------------------- Category Data -------------------
  // -----------------

  List<CategoryModel> _categorydata = [];
  List<CategoryModel> get categorydata => _categorydata;

  getcategorydata(List<CategoryModel> model) {
    _categorydata = model;
    notifyListeners();
  }

  // -------Category Data -------
  List<ItemModel> categoryiddata(String id) =>
      _itemdata.where((e) => e.categoryId == id).toList();
  // -------Discount Data -------
  List<ItemModel> discountdata(double discount) =>
      _itemdata.where((e) => e.discount == discount).toList();

  // -------Order Menu Id Data -------
  List<ItemModel> orderMenuIdData(String id) =>
      itemdata.where((e) => e.menuid == id).toList();
  // -------Is live Data -------
  List<ItemModel> isliveData() =>
      itemdata.where((e) => e.islive == true).toList();
  // -------Type Data -------
  List<ItemModel> typeData(String menutype) =>
      itemdata.where((e) => e.menutype == menutype).toList();

  // -------Popular Restaurant Data -------
  List<RestaurantModel> popularRestaurantsData() =>
      _restaurantData.where((e) => e.restaurantRatings >= 3).toList();

  // --------------------- Restaurant Data -------------------
  // -----------------

  List<ItemModel> getRestaurantItems(String restaurantId) => _itemdata
      .where((element) => element.restaurantID == restaurantId)
      .toList();
}
