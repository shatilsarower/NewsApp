import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/Model/article_model.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url = Uri.parse(
            "https://newsapi.org/v2/everything?q=tesla&from=2021-05-10&sortBy=publishedAt&apiKey=145b82a7536d4fffa99752761f8e1355")
        as String;
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach(() {});
    }
  }
}
