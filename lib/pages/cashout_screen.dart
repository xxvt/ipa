import 'package:coinbase/constants/constants.dart';
import 'package:coinbase/pages/actual_cashout.dart';
import 'package:coinbase/pages/preview_cashout.dart';
import 'package:coinbase/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../utils/balance_controller.dart';
import '../widgets/keyboard_button.dart';

class CashoutPage extends StatefulWidget {
  const CashoutPage({Key? key});

  @override
  State<CashoutPage> createState() => _CashoutPageState();
}

class _CashoutPageState extends State<CashoutPage> {
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController(text: '\$');
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Cash out",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(() {
                                double balanceValue =
                                    Get.find<BalanceController>().balance.value;
                                var formatter =
                                    NumberFormat('#,###.0', 'en_US');
                                String formattedValue =
                                    formatter.format(balanceValue);

                                return Text(
                                  '\$$formattedValue available',
                                  style: TextStyle(fontSize: 10.sp),
                                );
                              }),
                              SizedBox(
                                width: 2.5.w,
                              ),
                              Icon(
                                Icons.info_outlined,
                                size: 4.w,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: TextField(
                        textAlign: TextAlign
                            .center, // Aligns the text to center horizontally

                        controller: _amountController,
                        keyboardType: TextInputType.none,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50.sp,
                            color: buttonColor),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '\$0',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 2.5.w,
                        ),
                        const Icon(
                          Icons.credit_card_rounded,
                          color: buttonColor,
                        ),
                        SizedBox(
                          width: 4.5.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "SWEDBANK...",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "*** 4939",
                                style: TextStyle(color: Colors.white30),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down_outlined,
                          color: buttonColor,
                          size: 10.w,
                        ),
                        SizedBox(
                          width: 2.5.w,
                        ),
                      ],
                    ),
                    height: 10.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      border: Border.all(color: Colors.white30, width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      KeyboardButton(
                          text: '1',
                          onTap: (text) {
                            setState(() {
                              _amountController.text += text;
                            });
                          }),
                      KeyboardButton(
                          text: '2',
                          onTap: (text) {
                            setState(() {
                              _amountController.text += text;
                            });
                          }),
                      KeyboardButton(
                          text: '3',
                          onTap: (text) {
                            setState(() {
                              _amountController.text += text;
                            });
                          }),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      KeyboardButton(
                          text: '4',
                          onTap: (text) {
                            setState(() {
                              _amountController.text += text;
                            });
                          }),
                      KeyboardButton(
                          text: '5',
                          onTap: (text) {
                            setState(() {
                              _amountController.text += text;
                            });
                          }),
                      KeyboardButton(
                          text: '6',
                          onTap: (text) {
                            setState(() {
                              _amountController.text += text;
                            });
                          }),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      KeyboardButton(
                          text: '7',
                          onTap: (text) {
                            setState(() {
                              _amountController.text += text;
                            });
                          }),
                      KeyboardButton(
                          text: '8',
                          onTap: (text) {
                            setState(() {
                              _amountController.text += text;
                            });
                          }),
                      KeyboardButton(
                          text: '9',
                          onTap: (text) {
                            setState(() {
                              _amountController.text += text;
                            });
                          }),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      KeyboardButton(
                          text: '.',
                          onTap: (text) {
                            setState(() {
                              _amountController.text += text;
                            });
                          }),
                      KeyboardButton(
                          text: '0',
                          onTap: (text) {
                            setState(() {
                              _amountController.text += text;
                            });
                          }),
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          if (_amountController.text.isNotEmpty) {
                            final currentText = _amountController.text;
                            final newText = currentText.substring(
                                0, currentText.length - 1);
                            setState(() {
                              _amountController.text = newText;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  InkWell(
                    onTap: () {
                      if (_amountController.text.isNotEmpty) {
                        String text = _amountController.text;
                        String numberText = text.replaceAll(RegExp(r'[^0-9.]'),
                            ''); // Remove non-numeric characters

                        double? amount;
                        //  amount = double.parse(numberText);
                        try {
                          amount = double.parse(numberText);
                          // Now, use the 'amount' and check it against the balance in the controller
                          BalanceController balanceController =
                              Get.find<BalanceController>();
                          if (amount > balanceController.balance.value) {
                            showErrorSnackBar("Insufficient balance",
                                "You don't have enough balance for this operation");
                          } else {
                            balanceController
                                .subtract(amount); // from the balance

                            Get.to(() => PreviewCashoutPage(amount: amount!));
                          }
                        } catch (e) {
                          showErrorSnackBar(
                              "Invalid amount", "Please enter a valid amount");
                          return;
                        }
                      }
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
                          "Preview cash out",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 14.sp),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double fontSize = 18.sp;
  Widget _buildKeyboardButton(String text) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _amountController.text += text;
          fontSize = 40.sp;
        });
      },
      onTapUp: (details) {
        setState(() {
          fontSize = 18.sp;
        });
      },
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 200),
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
        child: Container(
          alignment: Alignment.center,
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            // color: Colors.grey.withOpacity(0.1),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
