import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/helpers/base_getters.dart';
import 'package:food_delivery/helpers/common_items_tile.dart';
import 'package:food_delivery/models/app_models.dart';
import 'package:food_delivery/helpers/items_detail_page.dart';
import 'package:food_delivery/services/style_sheet.dart';

// ignore: must_be_immutable
class PopularRestarantsItemPage extends StatelessWidget {
  List<ItemModel> model;
  PopularRestarantsItemPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightgrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              AppServices.popView(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.black,
              size: 30.sp,
            )),
        title: Text(
          "All Menu",
          style: AppTextTheme.fs18SemiBold().copyWith(color: AppColor.black),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20.0.sp),
        child: GridView.builder(
            itemCount: model.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            itemBuilder: (context, index) => CommonItemsTile(
                  model: model[index],
                  onPressed: () {
                    AppServices.pushto(
                        ItemsDetailPage(
                          model: model[index],
                        ),
                        context);
                  },
                )),
      )),
    );
  }
}
