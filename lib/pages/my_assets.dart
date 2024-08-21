import 'package:coinbase/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../utils/balance_controller.dart';

class AssetsWidget extends StatelessWidget {
  const AssetsWidget({
    Key? key,
  }) : super(key: key);

  Future<void> _refreshData() async {
    // Here you can call your data loading or refreshing functions.
    // For example, you might want to fetch data from a server and update the state of your widget.
    // This function should return only when the data refreshing is complete.
    // For now, just delay for 1 second for demo purpose.
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(4.w),
        child: RefreshIndicator(
          onRefresh: _refreshData,
          child: ListView(
            physics: AlwaysScrollableScrollPhysics(),
            children: [
              Text(
                "Total balance",
                style: TextStyle(color: Colors.white54),
              ),
              SizedBox(
                height: .5.h,
              ),
              Obx(() {
                double balanceValue =
                    Get.find<BalanceController>().balance.value;
                var formatter = NumberFormat('#,###.0', 'en_US');
                String formattedValue = formatter.format(balanceValue);

                return Text(
                  '\$$formattedValue',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                );
              }),
              SizedBox(
                height: .5.h,
              ),
              Text(
                "My balances",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BalanceWidget(
                    balance: Obx(() {
                      double balanceValue =
                          Get.find<BalanceController>().balance.value;
                      var formatter = NumberFormat('#,###.0', 'en_US');
                      String formattedValue = formatter.format(balanceValue);

                      return Text(
                        '\$$formattedValue',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      );
                    }),
                    imagePath: "assets/wallet.png",
                    title: "Parimary balance",
                  ),
                  BalanceWidget(
                    balance: Text(
                      '\$${0.00}',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    title: "Web3 wallet",
                    imagePath: "assets/web3.png",
                  ),
                ],
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Container(height: 15.h, child: Image.asset("assets/crypto.png")),
              SizedBox(
                height: 2.5.h,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Get started with crypto",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                  )),
              Align(
                  alignment: Alignment.center,
                  child: Text("Your crypto assets will appear here")),
              SizedBox(
                height: 2.5.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 8.h,
                  child: Center(
                    child: Text(
                      "Explore assets",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.sp),
                    ),
                  ),
                  width: 80.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xff32363d),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({
    super.key,
    required this.balance,
    required this.imagePath,
    required this.title,
  });
  final Widget balance;
  final String imagePath;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 7.h,
              width: 6.h,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(imagePath))),
            ),
          ),
          Text(title),
          balance,
        ],
      ),
      height: 16.h,
      width: 40.w,
      decoration: BoxDecoration(
          color: Color(0xff32363d), borderRadius: BorderRadius.circular(10)),
    );
  }
}
