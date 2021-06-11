import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/Extracted%20Widget/Category_Section.dart';
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
  bool _loading = false;
  void initState() {
    //_loading = false;
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      //_loading = true;
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
              child: LinearProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    /// Categories
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      height: 80,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            imageUrl: categories[index].imageUrl,
                            categoryName: categories[index].categoryName,
                          );
                        },
                      ),
                    ),

                    /// Blogs
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return BlogTile(
                            imageUrl: articles[index].urlToImage,
                            title: articles[index].title,
                            desc: articles[index].description,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;
  CategoryTile({
    this.imageUrl,
    this.categoryName,
  });
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
          Text(desc),
        ],
      ),
    );
  }
}
