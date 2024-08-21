import 'package:coinbase/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../constants/constants.dart';

class ActualCashoutPage extends StatefulWidget {
  ActualCashoutPage({super.key, required this.amount});
  double amount;

  @override
  State<ActualCashoutPage> createState() => _ActualCashoutPageState();
}

class _ActualCashoutPageState extends State<ActualCashoutPage> {
  late String formattedValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var formatter = NumberFormat('#,###.0', 'en_US');
    formattedValue = formatter.format(widget.amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 15.h,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: buttonColor),
                child: Center(
                    child: Icon(
                  Icons.done_outlined,
                  size: 10.h,
                ))),
            SizedBox(
              height: 10.5.h,
            ),
            Text("Your cash is on its way"),
            SizedBox(
              height: 3.5.h,
            ),
            Text(
              '\$$formattedValue',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 3.5.h,
            ),
            Text("We'll notify you when your cash out is complete."),
            Expanded(
              child: SizedBox(
                height: 3.5.h,
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => HomePage());
              },
              child: Container(
                height: 8.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    "View account",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 14.sp),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
