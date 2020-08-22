import 'dart:convert';
import 'package:http/http.dart' as http;

class GiphyService {
  static Future<Map> getGifs(String _search, int _offset) async {
    http.Response response;

    if (_search == null || _search.isEmpty) {
      response = await http.get(
          "https://api.giphy.com/v1/gifs/trending?api_key=0KNtl8kPHwtxjMHZEPdIJQ7TNh0ElXo1&limit=20&rating=g");
    } else {
      response = await http.get(
          "https://api.giphy.com/v1/gifs/search?api_key=0KNtl8kPHwtxjMHZEPdIJQ7TNh0ElXo1&q=$_search&limit=19&offset=$_offset&rating=g&lang=en");
    }
    return json.decode(response.body);
  }
}