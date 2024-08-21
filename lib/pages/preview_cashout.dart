import 'package:coinbase/pages/actual_cashout.dart';
import 'package:coinbase/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../constants/constants.dart';
import '../utils/balance_controller.dart';

class PreviewCashoutPage extends StatefulWidget {
  PreviewCashoutPage({super.key, required this.amount});
  double amount;

  @override
  State<PreviewCashoutPage> createState() => _PreviewCashoutPageState();
}

class _PreviewCashoutPageState extends State<PreviewCashoutPage> {
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
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text(
          "Confirm cash out",
        ),
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '\$$formattedValue',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 3.5.h,
            ),
            const Divider(),
            SizedBox(
              height: 3.5.h,
            ),
            const TextWidget(
              first: "To",
              second: "Swedbank",
            ),
            SizedBox(
              height: 3.5.h,
            ),
            const TextWidget(
              first: "From",
              second: "Cash (USD)",
            ),
            SizedBox(
              height: 3.5.h,
            ),
            TextWidget(
              first: "Funds will arive",
              second: formatSecondParameter(),
            ),
            SizedBox(
              height: 3.5.h,
            ),
            TextWidget(
              first: "Cash out amount",
              second: "\$$formattedValue",
            ),
            SizedBox(
              height: 3.5.h,
            ),
            const TextWidget(
              first: "Cash out fee",
              second: "\$0.00",
            ),
            SizedBox(
              height: 3.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Available Balance",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                ),
                const Expanded(child: SizedBox()),
                Obx(() {
                  double balanceValue =
                      Get.find<BalanceController>().balance.value;
                  var formatter = NumberFormat('#,###.0', 'en_US');
                  String formattedValue = formatter.format(balanceValue);

                  return Text(
                    '\$$formattedValue',
                  );
                }),
              ],
            ),
            SizedBox(
              height: 3.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Total",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  "\$$formattedValue",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                height: 3.5.h,
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => ActualCashoutPage(
                      amount: widget.amount,
                    ));
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
                    "Cash out now",
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

  String formatSecondParameter() {
    DateTime currentDate = DateTime.now();
    DateTime newDate = currentDate.add(Duration(days: 2));
    String formattedDate = DateFormat('EEEE, M/d/yyyy').format(newDate);
    return formattedDate;
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.first,
    required this.second,
  });

  final String first;
  final String second;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          first,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
        ),
        const Expanded(child: SizedBox()),
        Text(second),
      ],
    );
  }
}
