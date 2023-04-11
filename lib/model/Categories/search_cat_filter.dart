import 'dart:convert';

import 'package:http/http.dart' as http;

class SearchCatFilter {
  static Future<List<String>> filterCategories(String typedText) async {
    final url =
        "https://api.trocbuy.fr/flutter/xav_cats_name_filter.php?search_text=$typedText";
    final response = await http.get(Uri.parse(url));
    final List<String> categories =
        List<String>.from(json.decode(response.body));
    return categories /*.where((category) {
      final categoryLower = category.toLowerCase();
      final typedTextLower = typedText.toLowerCase();

      return categoryLower.contains(typedTextLower);
    }).toList()*/
        ;
  }
}
