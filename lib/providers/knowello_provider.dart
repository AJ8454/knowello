import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:knowello/models/knowello_models.dart';

class KnowelloServiceProvider with ChangeNotifier {
  var url =
      'https://li3bzg1xs9.execute-api.ap-south-1.amazonaws.com/default/getInstaPosts';

  // setter
  List<Post> _items = [];

  // getter
  List<Post> get items {
    return [..._items];
  }

  Future getKnowelloGram() async {
    final response = await http.get(Uri.parse(url));
    final extractedData = json.decode(response.body);
    List<Post> postsData;
    postsData = List.generate(
        extractedData["posts"].length,
        (index) => Post(
              images: extractedData["posts"][index]["images"],
              description: extractedData["posts"][index]["description"],
              interactions: Interactions.fromJson(
                  extractedData["posts"][index]["interactions"]),
              postedBy: extractedData["posts"][index]["postedBy"],
              profileImage: extractedData["posts"][index]["profileImage"],
            ));
    var idt = postsData[0].interactions;
    log('${idt!.likes}');
    log('dt ${postsData[0].profileImage}');
    _items = postsData;
  }
}
