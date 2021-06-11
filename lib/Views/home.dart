import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/Extracted_Widget/Category_Section.dart';
import 'package:newsapp/Helper/data.dart';
import 'package:newsapp/Helper/news.dart';
import 'package:newsapp/Model/article_model.dart';
import 'package:newsapp/Model/category_Model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;
  void initState() {
    super.initState();
    categories = getCategories();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "NEWS",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
      body: _loading
          ? Container(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryTile(
                          imageUrl: categories[index].imageUrl,
                          categoryName: categories[index].categoryName,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CategorySection(
        imageUrl: imageUrl,
        categoryName: categoryName,
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc;
  BlogTile({
    @required this.imageUrl,
    @required this.title,
    @required this.desc,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(imageUrl),
          Text(title),
          Text(title),
        ],
      ),
    );
  }
}
