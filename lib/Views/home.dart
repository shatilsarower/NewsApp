import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "News",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        elevation: 5.0,
      ),
      body: Container(
        child: ,
      ),
    );
  }
}


class CategoryTile extends StatelessWidget {

  final imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.network(imageUrl,width: 120,height: 60,),
        ],
      ),
    );
  }
}
