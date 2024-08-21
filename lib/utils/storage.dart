import 'package:shared_preferences/shared_preferences.dart';

class BalanceStorage {
  static const _balanceKey = 'balance';

  Future<void> saveBalance(double balance) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_balanceKey, balance);
  }

  Future<double> getBalance() async {
    final prefs = await SharedPreferences.getInstance();
    double balance = prefs.getDouble(_balanceKey) ?? 0.0;
    return balance;
  }
}
