import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/AllFunction/allfunction.dart';
import 'package:food_delivery/controllers/all_controllers.dart';
import 'package:food_delivery/controllers/database_controllers/databasehandler_uri_controllers.dart';
import 'package:food_delivery/helpers/base_getters.dart';
import 'package:food_delivery/helpers/common_items_tile.dart';
import 'package:food_delivery/helpers/items_detail_page.dart';
import 'package:food_delivery/screens/popularrestarantsitem.dart';
import 'package:food_delivery/screens/search_screen.dart';
import 'package:food_delivery/services/icons_image.dart';
import 'package:food_delivery/services/style_sheet.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List bannerlist = [
    AppImage.posterimg,
    AppImage.poster2,
    AppImage.posterimg,
    AppImage.poster2,
  ];
  int currentindex = 0;
  int currentindex2 = 0;
  @override
  void initState() {
    super.initState();
    initializeData();
  }

  initializeData() async {
    if (!await rebuild()) return;
    final apiprovider =
        Provider.of<DatabaseHandlerController>(context, listen: false);
    await apiprovider.setMeals(context);
    await apiprovider.setcategorydata(context);
    await AllFunction().restaurantFunction(context);
    await AllFunction().orderFunction(context);
  }

// -------------- Rebuild Function----
// -----------------
  Future<bool> rebuild() async {
    if (!mounted) return false;

    // if there's a current frame,
    if (SchedulerBinding.instance.schedulerPhase != SchedulerPhase.idle) {
      // wait for the end of that frame.
      await SchedulerBinding.instance.endOfFrame;
      if (!mounted) return false;
    }

    setState(() {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AllControllers>(context);
    final apiprovider = Provider.of<DatabaseHandlerController>(context);

    final categoriesdata = apiprovider.categorydata;
    final mealsdata = apiprovider.mealsdata;
    var history = AllControllers.initializeOrderHistory(db);
    final pricedata = db.getviews(500);
    final categorydata = db.categorydata;
    //Save 50% Discount Data ------
    final discountdata = db.discountdata(50);
    //Popular Restaurants  Data ------
    final popularRestaurant = db.popularRestaurantsData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.home_outlined,
              color: AppColor.black,
              size: 35.sp,
            )),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Home",
              style:
                  AppTextTheme.fs17SemiBold().copyWith(color: AppColor.black),
            ),
            Text(
              "21-42-34, Banjara Hills, Hyder....",
              style: AppTextTheme.fs16Normal().copyWith(color: AppColor.grey),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                AppServices.pushto(const SearchPage(), context);
              },
              icon: Icon(
                Icons.favorite_border,
                color: AppColor.lightgreen2,
                size: 35.sp,
              ))
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20.0.sp),
        child: SingleChildScrollView(
          child: db.getLoadingState
              ? const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: AppColor.grey,
                  ),
                )
              : Column(
                  children: [
                    // =================================Uri Data Test=================-=-==========-==-=-
                    // AspectRatio(
                    //     aspectRatio: 3,
                    //     child: ListView.builder(
                    //         itemCount: categoriesdata.length,
                    //         shrinkWrap: true,
                    //         scrollDirection: Axis.horizontal,
                    //         itemBuilder: (context, i) {
                    //           final data = categoriesdata[i];
                    //           return Container(
                    //             margin: EdgeInsets.only(right: 25.w),
                    //             width:
                    //                 AppServices.getscreenwidth(context) * 0.4,
                    //             child: Column(
                    //               children: [
                    //                 ClipRRect(
                    //                   borderRadius: BorderRadius.circular(50.r),
                    //                   child: Image.network(
                    //                     data.strCategoryThumb,
                    //                     height: 100,
                    //                   ),
                    //                 ),
                    //                 // Text(data.idMeal),
                    //                 Text(
                    //                   data.strCategory,
                    //                   overflow: TextOverflow.ellipsis,
                    //                   maxLines: 1,
                    //                 )
                    //               ],
                    //             ),
                    //           );
                    //         })),
                    // AspectRatio(
                    //     aspectRatio: 2,
                    //     child: ListView.builder(
                    //         itemCount: mealsdata.length,
                    //         shrinkWrap: true,
                    //         scrollDirection: Axis.horizontal,
                    //         itemBuilder: (context, i) {
                    //           final data = mealsdata[i];
                    //           return Container(
                    //             margin: EdgeInsets.only(right: 25.w),
                    //             width:
                    //                 AppServices.getscreenwidth(context) * 0.4,
                    //             child: Column(
                    //               children: [
                    //                 ClipRRect(
                    //                   borderRadius: BorderRadius.circular(50.r),
                    //                   child: Image.network(
                    //                     data.strMealThumb,
                    //                     height: 100,
                    //                   ),
                    //                 ),
                    //                 Text(data.idMeal),
                    //                 Text(
                    //                   data.strMeal,
                    //                   overflow: TextOverflow.ellipsis,
                    //                   maxLines: 1,
                    //                 )
                    //               ],
                    //             ),
                    //           );
                    //         })),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: TextFormField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor.lightgrey,
                              prefixIcon: Icon(
                                Icons.search,
                                size: 35.sp,
                                color: AppColor.greydark,
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.r)),
                              hintText: "Search food nearby",
                              hintStyle: AppTextTheme.fs17Medium()
                                  .copyWith(color: AppColor.grey)),
                        )),
                        AppServices.addwidth(10),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r))),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.filter_alt_outlined,
                                color: AppColor.green,
                                size: 25.sp,
                              )),
                        )
                      ],
                    ),
                    CarouselSlider(
                        items: bannerlist.map((e) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Image.asset(e),
                          );
                        }).toList(),
                        options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 1,
                          aspectRatio: 2.7,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentindex = index;
                            });
                          },
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          bannerlist.length,
                          (i) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.w),
                                width: 8.w,
                                height: 8.h,
                                decoration: BoxDecoration(
                                  color: currentindex == i
                                      ? AppColor.green
                                      : AppColor.lightgreen,
                                  shape: BoxShape.circle,
                                ),
                              )),
                    ),
                    AppServices.addheight(30.h),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20.sp),
                          margin: EdgeInsets.symmetric(horizontal: 10.w),
                          width: AppServices.getscreenwidth(context),
                          height: AppServices.getscreenheight(context) * 0.5,
                          decoration: BoxDecoration(
                              color: AppColor.lightyellow,
                              borderRadius: BorderRadius.circular(23.r)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(TextSpan(
                                      text: "Looking for ",
                                      style: AppTextTheme.fs19Normal()
                                          .copyWith(color: AppColor.orange),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: "Breakfast?",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700))
                                      ])),
                                  Text(
                                    "Here’s what you might like to taste",
                                    style: AppTextTheme.fs14Normal()
                                        .copyWith(color: AppColor.grey),
                                  ),
                                ],
                              ),
                              Row(
                                children: List.generate(
                                  pricedata.length,
                                  (index) => Container(
                                    width: 40.w,
                                    height: 3.h,
                                    decoration: BoxDecoration(
                                      color: currentindex2 == index
                                          ? AppColor.orange
                                          : AppColor.grey,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            CarouselSlider(
                                items: pricedata
                                    .map((e) => CommonItemsTile(
                                          model: e,
                                          onPressed: () {
                                            AppServices.pushto(
                                                ItemsDetailPage(
                                                  model: e,
                                                ),
                                                context);
                                          },
                                        ))
                                    .toList(),
                                options: CarouselOptions(
                                  // autoPlay: true,
                                  aspectRatio: 1.3,
                                  viewportFraction: 0.55,
                                  enableInfiniteScroll: false,
                                  onPageChanged: (index, reason) =>
                                      currentindex2 = index,
                                )),
                          ],
                        )
                      ],
                    ),
                    AspectRatio(
                      aspectRatio: 3,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: categorydata.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) => Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(categorydata[i].image),
                                  Text(
                                    categorydata[i].title,
                                    style: AppTextTheme.fs13Medium(),
                                  )
                                ],
                              )),
                    ),
                    ListTile(
                      title: Text(
                        "Save Rescued Food for 50%!",
                        style: AppTextTheme.fs17Bold()
                            .copyWith(color: AppColor.green),
                      ),
                      subtitle: Text(
                        "Left over supplies and food have been used up.",
                        style: AppTextTheme.fs15Normal(),
                      ),
                      trailing: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 50.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.grey),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "All",
                                style: AppTextTheme.fs13Bold().copyWith(
                                    color: AppColor.black.withAlpha(100)),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15.sp,
                                color: AppColor.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    AppServices.addheight(15.h),
                    AspectRatio(
                        aspectRatio: 1.2,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: discountdata.length,
                            itemBuilder: (context, i) => CommonItemsTile(
                                  model: discountdata[i],
                                  bookmarkIcon: true,
                                  onPressed: () {
                                    AppServices.pushto(
                                        ItemsDetailPage(
                                          model: discountdata[i],
                                        ),
                                        context);
                                  },
                                ))),
                    AppServices.addheight(20.h),
                    ListTile(
                      title: Text(
                        "Order Again",
                        style: AppTextTheme.fs17Bold(),
                      ),
                      subtitle: Text(
                        "You Ordered from ${history.length.toString()} Restaurants",
                        style: AppTextTheme.fs15Normal(),
                      ),
                      trailing: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 50.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.grey),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "All",
                                style: AppTextTheme.fs13Bold().copyWith(
                                    color: AppColor.black.withAlpha(100)),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15.sp,
                                color: AppColor.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 3,
                      child: ListView.builder(
                          itemCount: history.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            var item = history[i];

                            return Container(
                              width: AppServices.getscreenwidth(context) * 0.75,
                              margin: EdgeInsets.only(right: 8.w),
                              padding: EdgeInsets.all(5.sp),
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.grey),
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    item.restaurant.restaurantLogo,
                                  ),
                                  AppServices.addwidth(5.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.restaurant.restaurantName,
                                        style: AppTextTheme.fs16SemiBold(),
                                      ),
                                      Text(
                                        item.ordertime,
                                        style: AppTextTheme.fs13Normal()
                                            .copyWith(color: AppColor.grey),
                                      ),
                                      AppServices.addheight(8.h),
                                      SizedBox(
                                        width: AppServices.getscreenwidth(
                                                context) *
                                            0.5,
                                        child: Text(
                                          item.items
                                              .map((e) => e.title.toString())
                                              .toList()
                                              .join(" * "),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppTextTheme.fs15Normal(),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                    AppServices.addheight(20.h),
                    ListTile(
                      title: Text.rich(TextSpan(
                          text: "Popular Restaurants ",
                          style: AppTextTheme.fs17Bold(),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Nearby",
                                style: AppTextTheme.fs17Bold().copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.grey))
                          ])),
                      subtitle: Text(
                        "Some of them offer rescued food.",
                        style: AppTextTheme.fs15Normal(),
                      ),
                      trailing: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 50.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.grey),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "All",
                                style: AppTextTheme.fs13Bold().copyWith(
                                    color: AppColor.black.withAlpha(100)),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15.sp,
                                color: AppColor.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 1.3,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: popularRestaurant.length > 5
                              ? 5
                              : popularRestaurant.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (contex, i) {
                            final restaurant = popularRestaurant[i];
                            final items =
                                db.getRestaurantItems(restaurant.restaurantId);
                            return InkWell(
                              onTap: () {
                                AppServices.pushto(
                                    PopularRestarantsItemPage(model: items),
                                    context);
                              },
                              child: Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  Container(
                                    width: AppServices.getscreenwidth(context) *
                                        0.5,
                                    margin: EdgeInsets.only(right: 10.w),
                                    decoration: BoxDecoration(
                                      color: AppColor.white,
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          alignment: Alignment(0.5.w, 1.1.h),
                                          children: [
                                            Image.asset(
                                                restaurant.restaurantImage,
                                                width: double.infinity,
                                                fit: BoxFit.cover),
                                            // restaurant.is_RestaurantDiscount
                                            //     ? Container(
                                            //         padding: EdgeInsets.all(5.sp),
                                            //         decoration: BoxDecoration(
                                            //             color: AppColor.white,
                                            //             border: Border.all(
                                            //                 color: AppColor.grey),
                                            //             borderRadius:
                                            //                 BorderRadius.circular(
                                            //                     10.r)),
                                            //         child: Text(
                                            //           restaurant.RestaurantId,
                                            //           style: AppTextTheme
                                            //               .fs_10_Bold(),
                                            //         ),
                                            //       )
                                            //     : SizedBox()
                                          ],
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      restaurant.restaurantName,
                                                      style: AppTextTheme
                                                          .fs17SemiBold(),
                                                    ),
                                                    Text(
                                                        items
                                                            .map((e) => e.type
                                                                .toString())
                                                            .toList()
                                                            .join(","),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        style: AppTextTheme
                                                                .fs14Light()
                                                            .copyWith(
                                                                color: AppColor
                                                                    .greydark)),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          restaurant
                                                              .restaurantStartedPrice
                                                              .toStringAsFixed(
                                                                  0),
                                                          style: restaurant.restaurantDiscount ==
                                                                  0
                                                              ? AppTextTheme
                                                                      .fs18Normal()
                                                                  .copyWith(
                                                                      color: AppColor
                                                                          .orange)
                                                              : AppTextTheme.fs11Normal().copyWith(
                                                                  decoration: restaurant
                                                                              .restaurantDiscount ==
                                                                          0
                                                                      ? TextDecoration
                                                                          .none
                                                                      : TextDecoration
                                                                          .lineThrough),
                                                        ),
                                                        AppServices.addwidth(
                                                            5.w),
                                                        restaurant.restaurantDiscount ==
                                                                0
                                                            ? const SizedBox()
                                                            : Text(
                                                                AllFunction()
                                                                    .discount(
                                                                        restaurant
                                                                            .restaurantDiscount,
                                                                        restaurant
                                                                            .restaurantStartedPrice
                                                                            .toInt())
                                                                    .toString(),
                                                                style: AppTextTheme
                                                                        .fs18Normal()
                                                                    .copyWith(
                                                                        color: AppColor
                                                                            .orange),
                                                              ),
                                                      ],
                                                    ),
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: Icon(
                                                          Icons
                                                              .bookmark_outlined,
                                                          size: 25.sp,
                                                          color: AppColor.grey,
                                                        ))
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  restaurant.isRestaurantDiscount
                                      ? Container(
                                          padding: EdgeInsets.all(5.sp),
                                          decoration: BoxDecoration(
                                              color: AppColor.orange,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(15.r),
                                                topRight: Radius.circular(15.r),
                                              )),
                                          child: Text(
                                            "${restaurant.restaurantDiscount.toStringAsFixed(0)}% OFF",
                                            style: AppTextTheme.fs13Bold()
                                                .copyWith(
                                                    color: AppColor.white),
                                          ),
                                        )
                                      : const SizedBox()
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
        ),
      )),
    );
  }
}
