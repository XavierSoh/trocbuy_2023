import 'dart:convert';

import 'package:http/http.dart' as http;
import '../utils/utils.dart';

class Keywords {
  static List<String> keyWordsList = <String>[];

  static Future<void> setKeyWordList() async {
    const String uri = '${Utils.baseUrl}/xav_key_words_list.php';
    final response = await http.get(Uri.parse(uri));
    final jsonResponse = jsonDecode(response.body);
    keyWordsList = List.from(jsonResponse);
  }
}
