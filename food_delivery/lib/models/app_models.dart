class OnBordingModel {
  String text, image;
  OnBordingModel(this.text, this.image);
}

class UserModel {
  String name, email, mobilenumber, password, image, userDateBirth;
  UserModel(this.name, this.email, this.mobilenumber, this.password, this.image,
      this.userDateBirth);
  UserModel.fromjson(Map<String, dynamic> json)
      : name = json["fullName"],
        email = json["emailaddress"],
        mobilenumber = json["mobilenumber"],
        password = json["password"],
        image = json["image"],
        userDateBirth = json["userDateBirth"];
}

// --------------------------ItemModel---------------------------------------------------
// --------------
class ItemModel {
  String menuid,
      restaurantID,
      categoryId,
      restaurantName,
      title,
      description,
      type,
      deliverytype,
      image,
      price,
      createdat,
      updatedat,
      views,
      totalordered,
      menutype;
  bool isoffered, hassizes, isdeliverable, islive;
  double discount, ratings;
  List<String> dealscategoreis, ingredientsImageList;
  List<OfferItemModel> offer;
  List<SizesItemModel> sizes;
  Map<String, dynamic> ingredients;
  ItemModel(
      this.menuid,
      this.restaurantID,
      this.categoryId,
      this.restaurantName,
      this.title,
      this.description,
      this.type,
      this.deliverytype,
      this.image,
      this.price,
      this.islive,
      this.createdat,
      this.updatedat,
      this.views,
      this.ratings,
      this.totalordered,
      this.menutype,
      this.isoffered,
      this.hassizes,
      this.isdeliverable,
      this.offer,
      this.sizes,
      this.ingredients,
      this.dealscategoreis,
      this.ingredientsImageList,
      this.discount);
  ItemModel.fromJson(Map<String, dynamic> json)
      : menuid = json['menu_id'],
        restaurantID = json['restaurant_ID'],
        categoryId = json['category_id'],
        restaurantName = json['restaurant_Name'],
        title = json['title'],
        description = json['description'],
        type = json["type"],
        deliverytype = json["Delivery_type"],
        image = json['image'],
        price = json['price'],
        islive = json['is_live'],
        createdat = json['`created_at`'],
        updatedat = json['updated_at'],
        views = json['views'],
        ratings = json['Ratings'].toDouble(),
        totalordered = json['total_ordered'],
        menutype = json['menu_type'],
        isoffered = json['is_offered'],
        hassizes = json['has_sizes'],
        discount = double.parse(json['discount'].toString()),
        dealscategoreis = (json['Deals_categoreis'] as List)
            .map((e) => e.toString())
            .toList(),
        ingredientsImageList = (json['Ingredients_Image_List'] as List)
            .map((e) => e.toString())
            .toList(),
        isdeliverable = json['is_deliverable'],
        offer = json["offer"] == null
            ? []
            : (json["offer"] as List)
                .map((e) => OfferItemModel.fromJson(e))
                .toList(),
        sizes = json["sizes"] == null
            ? []
            : (json["sizes"] as List)
                .map((e) => SizesItemModel.fromJson(e))
                .toList(),
        ingredients = json["ingredients"];
}

// ---------Items offer Model---
// ---------------
class OfferItemModel {
  String offer1, offer2;
  OfferItemModel(this.offer1, this.offer2);
  OfferItemModel.fromJson(Map<String, dynamic> json)
      : offer1 = json["offer1"],
        offer2 = json["offer2"];
}

// ---------Items sizes Model---
// ---------------
class SizesItemModel {
  String size, price;
  SizesItemModel(this.size, this.price);
  SizesItemModel.fromJson(Map<String, dynamic> json)
      : size = json["size"],
        price = json["price"];
}

// -----------------------------------------Items Model The End--------------------------------------------

// --------Category Model--------
// ----------
class CategoryModel {
  String title, image, categoryid;
  CategoryModel(this.title, this.image, this.categoryid);
  CategoryModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        image = json["image"],
        categoryid = json["category_id"];
}

// --------Restaurant Model--------
// ----------
class RestaurantModel {
  String restaurantName,
      restaurantId,
      restaurantLogo,
      restaurantImage,
      restaurantOpentime,
      restaurantClosetime;
  bool isRestaurantDiscount;
  int restaurantAllOrder;
  double restaurantRatings, restaurantStartedPrice, restaurantDiscount;
  RestaurantModel(
      this.restaurantName,
      this.restaurantClosetime,
      this.restaurantDiscount,
      this.restaurantId,
      this.restaurantImage,
      this.restaurantLogo,
      this.restaurantOpentime,
      this.restaurantAllOrder,
      this.restaurantRatings,
      this.restaurantStartedPrice,
      this.isRestaurantDiscount);
  RestaurantModel.fromJson(Map<String, dynamic> json)
      : restaurantName = json["RestaurantName"],
        restaurantClosetime = json["RestaurantClosetime"],
        restaurantOpentime = json["RestaurantOpentime"],
        restaurantId = json["RestaurantId"],
        restaurantImage = json["RestaurantImage"],
        restaurantLogo = json["RestaurantLogo"],
        restaurantDiscount = json["RestaurantDiscount"].toDouble(),
        restaurantAllOrder = json["RestaurantAllOrder"],
        restaurantRatings = json["RestaurantRatings"].toDouble(),
        restaurantStartedPrice = json["RestaurantStartedPrice"].toDouble(),
        isRestaurantDiscount = json["is_RestaurantDiscount"];
}

class OrderModel {
  String orderid, orderrestaurantid, ordertime, orderprice;
  List<String> ordermenuidlist;
  OrderModel(this.orderid, this.orderrestaurantid, this.ordertime,
      this.orderprice, this.ordermenuidlist);
  OrderModel.fromJson(Map<String, dynamic> json)
      : orderid = json["order_id"],
        orderrestaurantid = json["order_restaurant_id"],
        ordertime = json["order_time"],
        orderprice = json["order_price"],
        ordermenuidlist =
            (json["order_menu_id"] as List).map((e) => e.toString()).toList();
}

class OrderHistoryModel {
  RestaurantModel restaurant;
  List<ItemModel> items;
  double orderprice;
  String ordertime;
  OrderHistoryModel(
      this.restaurant, this.items, this.orderprice, this.ordertime);
}

//-----------SearchBtnModel------------------
// ------------
class SearchBtnModel {
  String title, id;
  SearchBtnModel(this.title, this.id);
}

// ===============================================================================
// --------Uri Category Model--------
// ----------
class CategoriesModel {
  String idCategory, strCategory, strCategoryThumb, strCategoryDescription;
  CategoriesModel(this.idCategory, this.strCategory, this.strCategoryThumb,
      this.strCategoryDescription);
  CategoriesModel.fromJson(Map<String, dynamic> json)
      : idCategory = json["idCategory"],
        strCategory = json["strCategory"],
        strCategoryThumb = json["strCategoryThumb"],
        strCategoryDescription = json["strCategoryDescription"];
}

// --------Uri Meals Model--------
// ----------
class MealsModel {
  String strMeal, strMealThumb, idMeal;
  MealsModel(
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  );
  MealsModel.fromJson(Map<String, dynamic> json)
      : strMeal = json["strMeal"],
        strMealThumb = json["strMealThumb"],
        idMeal = json["idMeal"];
}
