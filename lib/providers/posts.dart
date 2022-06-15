import 'package:flutter/material.dart';
import '../models/post.dart';

import 'package:http/http.dart' as http;

class Posts with ChangeNotifier {
  List<Post> _posts = [];

  Future<void> getUrlData() async {
    final url = Uri.parse('https://dev.api.spotlas.com/interview/feed?page=1');
    try {
      final response = await http.get(url);
      final data = dataFromMap(response.body);

      _posts = data;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  List<Post> get items {
    return [..._posts];
  }
}
