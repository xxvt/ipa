import 'dart:convert';
import 'dart:math';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:coinbase/constants/constants.dart';
import 'package:coinbase/pages/cashout_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../utils/balance_controller.dart';
import '../utils/helper.dart';
import 'my_assets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  double balance = 950.14;
  TextEditingController _searchController = TextEditingController();
  var lst = [];
  var lstScreens = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    lst = [
      const ActionWidget(
        assetImage: "assets/buy.png",
        text: "Buy",
      ),
      const ActionWidget(
        assetImage: "assets/send.png",
        text: "Send",
      ),
      const ActionWidget(
        assetImage: "assets/receive.png",
        text: "Receive",
      ),
      const ActionWidget(
        assetImage: "assets/scan.png",
        text: "Scan",
      ),
      const ActionWidget(
        assetImage: "assets/card.png",
        text: "Card",
      ),
      const ActionWidget(
        assetImage: "assets/earn.png",
        text: "Earn",
      ),
      const ActionWidget(
        assetImage: "assets/learning_rewards.png",
        text: "Learning rewards",
      ),
      const ActionWidget(
        assetImage: "assets/recurring_buys.png",
        text: "Recurring\nbuys",
      ),
      const ActionWidget(
        assetImage: "assets/coinbase_wallet.png",
        text: "Coinbase wallet",
      ),
      const ActionWidget(
        assetImage: "assets/advance_trade.png",
        text: "Advanced trade",
      ),
      const ActionWidget(
        assetImage: "assets/add_cash.png",
        text: "Add cash",
      ),
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CashoutPage(),
              ));
        },
        child: const ActionWidget(
          assetImage: "assets/cashout.png",
          text: "Cashout",
        ),
      ),
    ];
    lstScreens = [
      HomeWidget(balance: balance, lst: lst),
      AssetsWidget(),
      HomeWidget(balance: balance, lst: lst),
      HomeWidget(balance: balance, lst: lst),
      HomeWidget(balance: balance, lst: lst),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          selectedItemColor: const Color(0xff3267fa),
          unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
          type: BottomNavigationBarType.fixed,
          backgroundColor: backgroundColor,
          unselectedLabelStyle:
              const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          selectedLabelStyle: const TextStyle(color: Color(0xff3267fa)),
          items: [
            BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? Image.asset(
                      "assets/nav_bar/home_selected.png",
                      height: 3.5.h,
                    )
                  : Image.asset(
                      "assets/nav_bar/home.png",
                      height: 3.5.h,
                    ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? Image.asset(
                      "assets/nav_bar/assets_selected.png",
                      height: 3.5.h,
                    )
                  : Image.asset(
                      "assets/nav_bar/assets.png",
                      height: 3.5.h,
                    ),
              label: "My assets",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/nav_bar/trade.png",
                height: 3.5.h,
              ),
              label: "Trade",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/earn_b.png",
                height: 3.5.h,
              ),
              label: "Earn",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/nav_bar/web.png",
                height: 3.5.h,
              ),
              label: "Web3",
            ),
          ]),
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          decoration: BoxDecoration(
            color: const Color(0xff141518),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xff141518)),
          ),
          height: 4.5.h,
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.search),
              SizedBox(
                width: 2.w,
              ),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  onSubmitted: (value) {
                    double? parsedValue = double.tryParse(value);
                    if (parsedValue != null) {
                      Get.find<BalanceController>().add(parsedValue);
                    } else {
                      showErrorSnackBar(
                          "Invalid input", "Please enter a valid number");
                    }
                  },
                  decoration: const InputDecoration(
                      hintText: 'Search for an asset',
                      border: InputBorder.none),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const Drawer(),
      body: lstScreens[_selectedIndex],
    );
  }

  List<double> generateProgressList() {
    Random random = Random();
    List<double> values = [];

    // Generate initial random values
    for (var i = 0; i < 10; i++) {
      double randomNumber = 1 +
          random.nextDouble() * 4; // Generate a random double between 1 and 5
      values.add(randomNumber);
    }

    // Generate interpolated values from 5 to 100
    int steps = 5;
    for (var i = 5; i < 100; i += steps) {
      double start = i.toDouble();
      double end = (i + steps).toDouble();

      for (var j = 0; j < steps; j++) {
        double t = j / steps;
        double interpolatedValue = start + t * (end - start);
        values.add(interpolatedValue);
      }
    }
    values.add(100);

    // Generate final random values
    for (var i = 0; i < 10; i++) {
      double randomNumber = 100 +
          random.nextDouble() *
              10; // Generate a random double between 100 and 110
      values.add(randomNumber);
    }
    return values;
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.balance,
    required this.lst,
  });

  final double balance;
  final List lst;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Your balance",
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
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                        );
                      }),
                    ],
                  ),
                ),
                Container(
                    width: 20.w,
                    height: 10.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage("assets/image.png")),
                    )),
              ],
            ),
            const Divider(),
            Container(
              height: 36.h,
              child: GridView.builder(
                itemCount: lst.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return lst[index];
                },
              ),
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Prices",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 35.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Watchlist",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10.sp),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_sharp,
                        weight: 10.w,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const PricesWidget(
              coinImage: "assets/prices/bitcoin.png",
              coinName: "Bitcoin",
              coinShortName: "BTC",
              price: "\$29,266.58",
              percentage: "2.27%",
              graphImage: "assets/prices/bitcoin_graph.png",
            ),
            const PricesWidget(
              coinImage: "assets/prices/ethereum.png",
              coinName: "Ethereum",
              coinShortName: "ETH",
              price: "\$1,913.46",
              percentage: "2.44%",
              graphImage: "assets/prices/ethereum_graph.png",
            ),
            const PricesWidget(
              coinImage: "assets/prices/solana.png",
              coinName: "Solana",
              coinShortName: "2.40% APY",
              price: "\$22.38",
              percentage: "3.21%",
              graphImage: "assets/prices/ethereum_graph.png",
            ),
            const PricesWidget(
              coinImage: "assets/prices/litecoin.png",
              coinName: "Litecoin",
              coinShortName: "LTC",
              price: "\$88.52",
              percentage: "0.58%",
              graphImage: "assets/prices/litecoin_graph.png",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 40.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                      color: const Color(0xff31353d),
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add assets",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 40.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                      color: const Color(0xff31353d),
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "See all",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

class PricesWidget extends StatelessWidget {
  const PricesWidget({
    super.key,
    required this.coinName,
    required this.coinShortName,
    required this.coinImage,
    required this.graphImage,
    required this.price,
    required this.percentage,
  });

  final String coinName;
  final String coinShortName;
  final String coinImage;
  final String graphImage;
  final String price;
  final String percentage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 5.h,
              child: Image.asset(
                coinImage,
              )),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$coinName",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                ),
                Text(
                  "$coinShortName",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.sp,
                      color: const Color(0xff898f9c)),
                ),
              ],
            ),
          ),
          Container(
            height: 6.h,
            width: 30.w,
            child: Image.asset(
              graphImage,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      height: 2.5.h,
                      child: Image.asset("assets/prices/up.png")),
                  Text(
                    percentage,
                    style: const TextStyle(
                        color: Color(0xff28ad75), fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class ActionWidget extends StatelessWidget {
  final String assetImage;
  final String text;
  const ActionWidget({
    super.key,
    required this.assetImage,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.w),
      height: 12.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            assetImage,
            height: 5.h,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 8.sp),
          )
        ],
      ),
    );
  }
}
