import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../services/post_service.dart';

class PostProvider extends ChangeNotifier {
  List<PostModel> posts = [];
  bool isLoading = false;
  String? error;

  PostProvider() {
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      posts = await PostService.getPosts();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
