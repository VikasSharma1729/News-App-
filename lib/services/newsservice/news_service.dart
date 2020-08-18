import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/services/modals/newsmodal.dart';

class  NewsServiceBusiness{

  List<NewsModal> businessContent = [];
  final String urlForNews = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=4ef7fd52a741499fa4f2f1e48c4a6ae5";

  Future<dynamic> get businessNews async{

    final result = await http.get(urlForNews);

    final data = jsonDecode(result.body);

   
    if(data["status"]=="ok") {

      
        data['articles'].forEach((element){
          NewsModal newmodal = NewsModal(
            imageUrl: element['urlToImage'],
            title: element['title'],
            urlToOpenThePage: element['url'],
            description: element['description'],
          );
          businessContent.add(newmodal);
        });

        return [...businessContent];
    }
    else{
      return null;
    }
  }
}