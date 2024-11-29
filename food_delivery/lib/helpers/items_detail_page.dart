import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/AllFunction/allfunction.dart';
import 'package:food_delivery/helpers/base_getters.dart';
import 'package:food_delivery/models/app_models.dart';
import 'package:food_delivery/services/style_sheet.dart';

// ignore: must_be_immutable
class ItemsDetailPage extends StatefulWidget {
  ItemModel model;
  ItemsDetailPage({super.key, required this.model});

  @override
  State<ItemsDetailPage> createState() => _ItemsDetailPageState();
}

class _ItemsDetailPageState extends State<ItemsDetailPage> {
  int adddataint = 1;
  List<String> dropdowndata = ["Jalapeno", "Krishna", "Ram"];
  var dropdownvalue;
  @override
  Widget build(BuildContext context) {
    var price = AllFunction()
        .discount(widget.model.discount, int.parse(widget.model.price));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              AppServices.popView(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.white,
              size: 30.sp,
            )),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 3.w,
            ),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.white),
                borderRadius: BorderRadius.circular(30.r),
                color: AppColor.black.withAlpha(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.circle,
                  color: AppColor.white,
                ),
                AppServices.addwidth(5.w),
                Text(
                  widget.model.ratings.toString(),
                  style:
                      AppTextTheme.fs20Bold().copyWith(color: AppColor.white),
                ),
                AppServices.addwidth(5.w),
                const Icon(
                  Icons.star,
                  color: AppColor.white,
                ),
              ],
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            widget.model.image,
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                alignment: Alignment(0, -1.h),
                children: [
                  Container(
                    padding: EdgeInsets.all(20.sp),
                    height: AppServices.getscreenheight(context) * 0.7,
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r),
                            topRight: Radius.circular(30.r))),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppServices.addheight(30.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Description",
                                      style: AppTextTheme.fs20Thickest()
                                          .copyWith(color: AppColor.greydark),
                                    ),
                                    Text(
                                      widget.model.description,
                                      style: AppTextTheme.fs11Normal()
                                          .copyWith(color: AppColor.grey),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Nutritional Value",
                                      style: AppTextTheme.fs13Medium()
                                          .copyWith(color: AppColor.greydark),
                                    ),
                                    const Divider(
                                      color: AppColor.black,
                                      thickness: 1,
                                    ),
                                    ...List.generate(
                                        widget.model.ingredients.keys.length,
                                        (i) => Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      widget.model.ingredients
                                                          .keys
                                                          .toList()[i]
                                                          .toString(),
                                                      style: AppTextTheme
                                                          .fs10Light(),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      widget.model.ingredients
                                                          .values
                                                          .toList()[i]
                                                          .toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: AppTextTheme
                                                          .fs10Bold(),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                    const Divider(
                                      color: AppColor.black,
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          AppServices.addheight(30.h),
                          Container(
                            padding: EdgeInsets.only(
                                left: 10.w,
                                right: 10.w,
                                bottom: 10.h,
                                top: 3.h),
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(25.r),
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColor.grey,
                                    blurRadius: 3,
                                  )
                                ]),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Ingredients",
                                    style: AppTextTheme.fs14Medium()
                                        .copyWith(color: AppColor.grey),
                                  ),
                                ),
                                AppServices.addheight(3.h),
                                AspectRatio(
                                  aspectRatio: 6.5,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: widget
                                          .model.ingredientsImageList.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, i) => Padding(
                                            padding:
                                                EdgeInsets.only(right: 5.w),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                              child: Image.asset(
                                                widget.model
                                                    .ingredientsImageList[i],
                                                fit: BoxFit.cover,
                                                width: 90.w,
                                              ),
                                            ),
                                          )),
                                ),
                              ],
                            ),
                          ),
                          AppServices.addheight(20.h),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Additions",
                                style: AppTextTheme.fs18Medium(),
                              )),
                          AppServices.addheight(5.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 3.h),
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColor.orange),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                isDense: true,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  size: 20.sp,
                                  color: AppColor.orange,
                                ),
                                style: AppTextTheme.fs10Normal()
                                    .copyWith(color: AppColor.black),
                                items: dropdowndata
                                    .map((e) => DropdownMenuItem(
                                        value: e, child: Text(e)))
                                    .toList(),
                                onChanged: (v) => setState(() {
                                  dropdownvalue = v;
                                }),
                                value: dropdownvalue,
                              ),
                            ),
                          ),
                          AppServices.addheight(20.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 10.h),
                            decoration: BoxDecoration(
                                color: AppColor.orange,
                                borderRadius: BorderRadius.circular(20.sp)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  (int.parse(price) * adddataint).toString(),
                                  style: AppTextTheme.fs21Medium()
                                      .copyWith(color: AppColor.white),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: AppColor.white),
                                      borderRadius:
                                          BorderRadius.circular(20.sp)),
                                  child: Row(
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              adddataint--;
                                            });
                                          },
                                          child: Text(
                                            "-",
                                            style: AppTextTheme.fs21Thickest()
                                                .copyWith(
                                                    color: AppColor.white),
                                          )),
                                      Text(
                                        adddataint.toString(),
                                        style: AppTextTheme.fs21Medium()
                                            .copyWith(color: AppColor.white),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              adddataint++;
                                            });
                                          },
                                          child: Text(
                                            "+",
                                            style: AppTextTheme.fs21Thickest()
                                                .copyWith(
                                                    color: AppColor.white),
                                          )),
                                    ],
                                  ),
                                ),
                                IconButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              AppColor.white),
                                    ),
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.shopping_cart,
                                      size: 25.sp,
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 2.h),
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: const [
                              BoxShadow(
                                color: AppColor.grey,
                                blurRadius: 5,
                              )
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.model.restaurantName,
                              style: AppTextTheme.fs18Bold(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              widget.model.type,
                              style: AppTextTheme.fs12Light(),
                            ),
                          ],
                        ),
                      ),
                      // Dialog-------
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: AppColor.black,
                              shape: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15.r)),
                              title: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10.sp),
                                    decoration: BoxDecoration(
                                        color: AppColor.white,
                                        borderRadius:
                                            BorderRadius.circular(15.r)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "User 1",
                                          style: AppTextTheme.fs17Medium(),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(5.sp),
                                          decoration: BoxDecoration(
                                              color: AppColor.white,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: AppColor.orange,
                                                width: 2.w,
                                              )),
                                          child: const Icon(
                                            Icons.favorite,
                                            color: AppColor.orange,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AppServices.addheight(10.h),
                                  Container(
                                    padding: EdgeInsets.all(10.sp),
                                    decoration: BoxDecoration(
                                        color: AppColor.white,
                                        borderRadius:
                                            BorderRadius.circular(15.r)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "User 2",
                                          style: AppTextTheme.fs17Medium(),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(5.sp),
                                          decoration: BoxDecoration(
                                              color: AppColor.white,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: AppColor.orange,
                                                width: 2.w,
                                              )),
                                          child: const Icon(
                                            Icons.favorite,
                                            color: AppColor.orange,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(5.sp),
                          decoration: BoxDecoration(
                              color: AppColor.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColor.orange,
                                width: 2.w,
                              )),
                          child: Icon(
                            Icons.favorite,
                            color: AppColor.orange,
                            size: 30.sp,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
