import 'package:flutter/material.dart';
import 'package:newsapp/services/widgets/news_home.dart';

class NewsScreen extends StatelessWidget {

   String imageUrl;
   String description;
   String title;
   String url;

  NewsScreen({this.title,this.description,this.imageUrl,this.url});
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 8.0),
                child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

                    GestureDetector(
                      onTap: (){
                                     Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=> NewsHome(url: url,title: title,)));
                         },
                        child: Container(

                        height: 150,
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0)),
                            child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                    ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(6.0),
                        bottomRight: Radius.circular(6.0)
                      )
                  ),
                  height: 70,
                  child: Column(

                    children: <Widget>[
                      Text(
                        title,
                        style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                        )
                    ],
                  ),
                  
                )
                            ],
                          ),
                        ),

    );
  }
}