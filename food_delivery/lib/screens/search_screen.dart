import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/AllFunction/allfunction.dart';
import 'package:food_delivery/controllers/all_controllers.dart';
import 'package:food_delivery/controllers/dummy_data.dart';
import 'package:food_delivery/helpers/base_getters.dart';
import 'package:food_delivery/models/app_models.dart';
import 'package:food_delivery/helpers/items_detail_page.dart';
import 'package:food_delivery/services/style_sheet.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<ItemModel> btnData = [];

  @override
  Widget build(BuildContext context) {
    final providerdata = Provider.of<AllControllers>(context);
    return Scaffold(
      backgroundColor: AppColor.redbg,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0.sp),
            child: Column(
              children: [
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
                              borderRadius: BorderRadius.circular(16.r)),
                          hintText: "Fried Rice",
                          hintStyle: AppTextTheme.fs17Medium()
                              .copyWith(color: AppColor.black)),
                    )),
                    AppServices.addwidth(10.w),
                    Container(
                      padding: EdgeInsets.all(6.sp),
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          border: Border.all(color: AppColor.grey),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.r))),
                      child: IconButton(
                          style: TextButton.styleFrom(
                              side: const BorderSide(color: AppColor.grey)),
                          onPressed: () {},
                          icon: Icon(
                            Icons.filter_alt_outlined,
                            color: AppColor.green,
                            size: 25.sp,
                          )),
                    )
                  ],
                ),
                AppServices.addheight(10.h),
                AspectRatio(
                  aspectRatio: 7,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: DummyData.searchBtnData.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) => Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: TextButton(
                        onPressed: () {
                          searchBtn(
                              DummyData.searchBtnData[i].id, providerdata);
                        },
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(color: AppColor.white),
                                borderRadius: BorderRadius.circular(15.r))),
                        child: Text(
                          DummyData.searchBtnData[i].title,
                          style: AppTextTheme.fs16Normal()
                              .copyWith(color: AppColor.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(20.sp),
              alignment: Alignment.bottomCenter,
              width: AppServices.getscreenwidth(context),
              height: AppServices.getscreenheight(context) * 0.8,
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r))),
              child: ListView.builder(
                  itemCount: btnData.length,
                  itemBuilder: (context, index) {
                    final data = btnData[index];
                    return InkWell(
                      onTap: () {
                        AppServices.pushto(
                            ItemsDetailPage(model: data), context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20.h),
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(15.r),
                          boxShadow: const [
                            BoxShadow(blurRadius: 1),
                          ],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15.r),
                                  topLeft: Radius.circular(15.r)),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    data.image,
                                    width: AppServices.getscreenwidth(context),
                                    height: 120.h,
                                    fit: BoxFit.cover,
                                  ),
                                  data.discount == 0
                                      ? const SizedBox()
                                      : Container(
                                          margin: EdgeInsets.only(top: 5.h),
                                          padding: EdgeInsets.all(5.sp),
                                          decoration: BoxDecoration(
                                              color: AppColor.orange,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(15.sp),
                                                topRight:
                                                    Radius.circular(15.sp),
                                              )),
                                          child: Text(
                                            "${data.discount.toStringAsFixed(0)}% OFF",
                                            style: AppTextTheme.fs13Bold()
                                                .copyWith(
                                                    color: AppColor.white),
                                          ),
                                        )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0.sp),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.title,
                                        style: AppTextTheme.fs17SemiBold(),
                                      ),
                                      Text(
                                        data.type,
                                        style: AppTextTheme.fs14Normal()
                                            .copyWith(color: AppColor.grey),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            data.price,
                                            style: data.discount == 0
                                                ? AppTextTheme.fs18Extrabold()
                                                    .copyWith(
                                                        color: AppColor.orange)
                                                : AppTextTheme.fs11Normal()
                                                    .copyWith(
                                                        decoration: data
                                                                    .discount ==
                                                                0
                                                            ? TextDecoration
                                                                .none
                                                            : TextDecoration
                                                                .lineThrough),
                                          ),
                                          AppServices.addwidth(5.w),
                                          data.discount == 0
                                              ? const SizedBox()
                                              : Text(
                                                  AllFunction()
                                                      .discount(data.discount,
                                                          int.parse(data.price))
                                                      .toString(),
                                                  style:
                                                      AppTextTheme.fs18Normal()
                                                          .copyWith(
                                                              color: AppColor
                                                                  .orange),
                                                ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.w, vertical: 2.h),
                                    decoration: BoxDecoration(
                                        color: AppColor.green,
                                        borderRadius:
                                            BorderRadius.circular(20.r)),
                                    child: Text(
                                      "${data.ratings}",
                                      style: AppTextTheme.fs14Bold()
                                          .copyWith(color: AppColor.white),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      )),
    );
  }

  searchBtn(String id, AllControllers db) {
    switch (id) {
      case "Rescued":
        return setState(() {
          btnData = db.isliveData();
        });
      case "Vegan":
        return setState(() {
          btnData = db.discountdata(50);
        });
      case "Delivery":
        return setState(() {
          btnData = db.typeData("Breakfast");
        });
      case "Popular":
        return setState(() {
          btnData = db.isliveData();
        });
    }
  }
}
