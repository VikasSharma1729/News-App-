
import 'package:flutter/material.dart';
import 'package:newsapp/services/modals/newsmodal.dart';
import 'package:newsapp/services/newsservice/news_service.dart';
import 'package:newsapp/services/widgets/new_screen.dart';

import 'modals/category_modal.dart';
import 'widgets/category_screen.dart';


class Home extends StatefulWidget {

  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  Category modal = new Category();

  NewsServiceBusiness newsService = new NewsServiceBusiness();

  List<CategoryModal> item ;
  List<NewsModal> content;

  bool _showcontent = false;

  @override

  void initState() {

    // TODO: implement initState

    super.initState();
    statusChech();
  }

  void statusChech() async {
    var k = await newsService.businessNews;

    if(k !=null){
      setState(() {
        _showcontent = true;
        item = modal.getmodal; 
        content = k;
      });
    }
    else{

      print('something is wrong');

    }
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: new AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Flutter',
              style:TextStyle(fontSize: 24.0,fontWeight:FontWeight.bold)
              ),
            Text(
              'News',
              style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 24.0),
            )
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
      ),

      body:_showcontent==false ? Center(child: CircularProgressIndicator()) : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

            children: <Widget>[

              Container(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: item.length,
                  itemBuilder: (ctx,i)=>CategoryScreen( imageUrl: item[i].imageUrl, categoryName: item[i].categoryName,),
                ),
              ),


             SingleChildScrollView(
                
                 child:Container(
                   height: MediaQuery.of(context).size.height-167,
                  child: ListView.builder(
                    padding: EdgeInsets.all(8.0),
                    shrinkWrap: true,
                    itemCount: content.length,
                    itemBuilder: (ctx,i)=> NewsScreen(
                      imageUrl: content[i].imageUrl,
                      description: content[i].description,
                      title: content[i].title,
                      url: content[i].urlToOpenThePage,
                      )
                  ),
                 ),
             ),


            ],

        ),
      ),

    
    );
  }
}