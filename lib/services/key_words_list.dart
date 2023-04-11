import 'dart:convert' as json;

import 'package:http/http.dart' as http;

class Keywords {
  static List<String> keyWordsList = <String>[];

  static Future<void> setKeyWordList() async {
    const String uri = 'https://api.trocbuy.fr/flutter/xav_key_words_list.php';
    final response = await http.get(Uri.parse(uri));
    final jsonResponse = json.jsonDecode(response.body);
    keyWordsList = List.from(jsonResponse);
  }
}
