import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/Model/article_model.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url = Uri.parse(
            "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=145b82a7536d4fffa99752761f8e1355")
        as String;
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            contex: element["content"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
