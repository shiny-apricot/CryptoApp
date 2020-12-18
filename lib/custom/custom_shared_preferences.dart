import 'package:shared_preferences/shared_preferences.dart';


class SharedPref{
  Future<void> setCategory(String category) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('category', category);
    print('SHARED PREF SET category= $category');
  }

  Future<String> getCategory() async {
    final prefs = await SharedPreferences.getInstance();
    final category = prefs.getString('category');
    print('SHARED PREF GET category= $category');
    return category;
  }

}
