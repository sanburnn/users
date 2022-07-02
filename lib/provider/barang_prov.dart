import 'package:flutter/cupertino.dart';
import 'package:users/api/repostory.dart';
import 'package:users/model/barangModel.dart';

class Barangs with ChangeNotifier {
  final repostory = Repostory();

  List<Datum> allbarang;
  bool isLoading = true;

  Barangs() {
    this.getBarang();
    print("ok");
  }

  void getBarang() {
    isLoading = true;
    notifyListeners();
    repostory.getBarang().then((value) {
      isLoading = false;
      if (value != null) {
        allbarang = value;
        print(value);
      }

      notifyListeners();
    });
  }
}
