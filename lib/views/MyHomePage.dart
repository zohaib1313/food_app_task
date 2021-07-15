import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:food_application/view_models/MyHomePageViewModel.dart';
import 'package:provider/provider.dart';

import 'OnlineFoodServicePage.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

//  final viewModelHomePage=
  final unSelectedButtonStyle =
      TextStyle(fontWeight: FontWeight.normal, fontSize: 14);
  final selectedButtonStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  final selectedElevation = 2.2;

  @override
  Widget build(BuildContext context) {
    var myModel = Provider.of<MyHomePageViewModel>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.drag_handle,
                  color: Colors.grey,
                ),
                Stack(
                  children: [
                    RawMaterialButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => OnlineFoodServicePage(),
                          ),
                        );
                      },
                      elevation: 2.0,
                      fillColor: Colors.red,
                      child: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(12.r),
                      shape: CircleBorder(),
                    ),
                    Positioned(
                      left: 40.w,
                      right: 0.0,
                      child: Container(
                        padding: EdgeInsets.all(3.r),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        alignment: Alignment.center,
                        child: Text(
                          '1',
                          style: TextStyle(fontSize: 10.sp, color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20.w, top: 12.h),
          child: // <------------------------------------consumer
              Consumer<MyHomePageViewModel>(
            builder: (__, mm, _) {
              return Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                        padding: EdgeInsets.only(left: 0.sp, right: 20.sp),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                myModel.selectedBurgerTitle,
                                style: TextStyle(
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "FROM",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    myModel.selectedPrice,
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Image.asset("assets/images/burgerpng.png",
                          width: myModel.selectedBurgerWidth.w),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(4.sp),
                            child: Text(
                              "Size",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  myModel.selectSmallBurger();
                                },
                                elevation: myModel.selectedButton == "small"
                                    ? 4.0
                                    : 2.0,
                                fillColor: Colors.white,
                                child: Text(
                                  "S",
                                  style: myModel.selectedButton == "small"
                                      ? selectedButtonStyle
                                      : unSelectedButtonStyle,
                                ),
                                padding: EdgeInsets.all(15.sp),
                                shape: CircleBorder(),
                              ),
                              RawMaterialButton(
                                onPressed: () {
                                  myModel.selectMediumBurger();
                                },
                                elevation: myModel.selectedButton == "medium"
                                    ? 4.0
                                    : 2.0,
                                fillColor: Colors.white,
                                child: Text(
                                  "M",
                                  style: myModel.selectedButton == "medium"
                                      ? selectedButtonStyle
                                      : unSelectedButtonStyle,
                                ),
                                padding: EdgeInsets.all(15.sp),
                                shape: CircleBorder(),
                              ),
                              RawMaterialButton(
                                onPressed: () {
                                  myModel.selectLargeBurger();
                                },
                                elevation: myModel.selectedButton == "large"
                                    ? 4.0
                                    : 2.0,
                                fillColor: Colors.white,
                                child: Text(
                                  "L",
                                  style: myModel.selectedButton == "large"
                                      ? selectedButtonStyle
                                      : unSelectedButtonStyle,
                                ),
                                padding: EdgeInsets.all(15.sp),
                                shape: CircleBorder(),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(16.sp),
                      child: Text(
                        "Our Angry WHOOPER feature 1/4 lb* of flame-grilled beef, piled high with thick-cut bacon, American Cheese",
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
