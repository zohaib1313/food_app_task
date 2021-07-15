import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_application/view_models/OnlineFoodServiceViewModel.dart';
import 'MyHomePage.dart';
import 'package:provider/provider.dart';

class OnlineFoodServicePage extends StatelessWidget {
  OnlineFoodServicePage({Key? key}) : super(key: key);

  final unSelectedButtonStyle = TextStyle(
      fontWeight: FontWeight.normal, fontSize: 14, color: Colors.grey);
  final selectedButtonStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    var myModel =
        Provider.of<OnlineFoodServiceViewModel>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Container(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.drag_handle, color: Colors.grey),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RawMaterialButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(),
                              ),
                            );
                          },
                          elevation: 2.0,
                          fillColor: Colors.white,
                          child: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.black,
                          ),
                          padding: EdgeInsets.all(12.sp),
                          shape: CircleBorder(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Consumer<OnlineFoodServiceViewModel>(
          builder: (context, mm, child) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40.h),
                  padding: EdgeInsets.only(left: 20.w, top: 12.h),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "ONLINE FOOD\n SERVICE",
                          style: TextStyle(
                              fontSize: 28.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),

                ///search bar
                Container(
                  margin: EdgeInsets.only(top: 40.sp),
                  child: Container(
                    margin: EdgeInsets.only(left: 16.w, right: 16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.sp),
                      color: Colors.grey.shade200,
                      shape: BoxShape.rectangle,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search, color: Colors.black),
                      ),
                    ),
                  ),
                ),

                ///categories
                Container(
                  height: 60.h,
                  child: Center(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: myModel.listOfBurgerCategories.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(12.r),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                myModel.changeSelectedCategory(index);
                              },
                              child: Text(
                                myModel.listOfBurgerCategories[index],
                                style: myModel.selectedCategory == index
                                    ? selectedButtonStyle
                                    : unSelectedButtonStyle,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,

                    color: Colors.white,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(12.sp),
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.sp),
                                  color: Colors.grey.shade200,
                                  shape: BoxShape.rectangle,
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 20.h,
                                            left: 30.w,
                                            right: 30.w,
                                            bottom: 20.h),
                                        child: CircleAvatar(
                                          radius: 40.sp,
                                          backgroundColor: Colors.transparent,
                                          child: Image.asset(
                                              "assets/images/burgerthumb.png"),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.w),
                                      child: Text(
                                        "BURGER ${myModel.listOfBurgerCategories[myModel.selectedCategory]} $index",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 16.h),
                                      child: Text(
                                        "\$ ${2 * index}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.all(8.r),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.grey.shade200,
                      shape: BoxShape.rectangle,
                    ),
                    child: Image.asset("assets/images/burgerthumb.png"),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
