import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/AllFunction/allfunction.dart';
import 'package:food_delivery/helpers/base_getters.dart';
import 'package:food_delivery/models/app_models.dart';
import 'package:food_delivery/services/style_sheet.dart';

// ignore: must_be_immutable
class CommonItemsTile extends StatelessWidget {
  ItemModel model;
  bool bookmarkIcon;
  Function onPressed;
  CommonItemsTile(
      {super.key,
      required this.model,
      this.bookmarkIcon = false,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            width: AppServices.getscreenwidth(context) * 0.5,
            margin: EdgeInsets.only(right: 10.w),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(25.sp),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment(0.5.w, 1.1.h),
                  children: [
                    Image.asset(model.image,
                        width: double.infinity, fit: BoxFit.cover),
                    model.isdeliverable
                        ? Container(
                            padding: EdgeInsets.all(5.sp),
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                border: Border.all(color: AppColor.grey),
                                borderRadius: BorderRadius.circular(10.sp)),
                            child: Text(
                              model.deliverytype,
                              style: AppTextTheme.fs10Bold(),
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.title,
                              style: AppTextTheme.fs17SemiBold(),
                            ),
                            Text(model.restaurantName,
                                style: AppTextTheme.fs14Light()
                                    .copyWith(color: AppColor.greydark)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  model.price,
                                  style: model.discount == 0
                                      ? AppTextTheme.fs18Extrabold()
                                          .copyWith(color: AppColor.orange)
                                      : AppTextTheme.fs11Normal().copyWith(
                                          decoration: model.discount == 0
                                              ? TextDecoration.none
                                              : TextDecoration.lineThrough),
                                ),
                                AppServices.addwidth(5.w),
                                model.discount == 0
                                    ? const SizedBox()
                                    : Text(
                                        AllFunction()
                                            .discount(model.discount,
                                                int.parse(model.price))
                                            .toString(),
                                        style: AppTextTheme.fs18Normal()
                                            .copyWith(color: AppColor.orange),
                                      ),
                              ],
                            ),
                            bookmarkIcon
                                ? IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.bookmark_outlined,
                                      size: 25.sp,
                                      color: AppColor.grey,
                                    ))
                                : const SizedBox()
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          model.discount == 0
              ? const SizedBox()
              : Container(
                  padding: EdgeInsets.all(5.sp),
                  decoration: BoxDecoration(
                      color: AppColor.orange,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.sp),
                        topRight: Radius.circular(15.sp),
                      )),
                  child: Text(
                    "${model.discount.toStringAsFixed(0)}% OFF",
                    style:
                        AppTextTheme.fs13Bold().copyWith(color: AppColor.white),
                  ),
                )
        ],
      ),
    );
  }
}
