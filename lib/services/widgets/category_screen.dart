import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {

  final String imageUrl;
  final String categoryName;

  CategoryScreen({this.categoryName,this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 125,
      child: Stack(
        children: <Widget>[
          ClipRRect(borderRadius: BorderRadius.circular(8.0),  child: Image.network(imageUrl,height: 60, width: 120,fit: BoxFit.cover,)),
          Container(
            alignment: Alignment.center,
          
            child: Text(categoryName,style: TextStyle( fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.white),)
            
            ),
        ],

      ),
      
    );
  }
}
