import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BalanceController extends GetxController {
  static const _balanceKey = 'balance';

  var balance = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    loadBalance();
  }

  Future<void> loadBalance() async {
    final prefs = await SharedPreferences.getInstance();
    balance.value = prefs.getDouble(_balanceKey) ?? 0.0;
    // updateBalance(0);
  }

  Future<void> saveBalance() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_balanceKey, balance.value);
  }

  void add(double value) {
    balance.value += value;
    saveBalance();
  }

  void subtract(double value) {
    balance.value -= value;
    saveBalance();
  }

  void updateBalance(double value) {
    balance.value = value;
    saveBalance();
  }
}
