import 'package:flutter/material.dart';
import '../models/photo_model.dart';
import '../services/photo_service.dart';

class PhotoProvider extends ChangeNotifier {
  List<PhotoModel> photos = [];
  bool isLoading = false;
  String? error;

  PhotoProvider() {
    fetchPhotos();
  }

  Future<void> fetchPhotos() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      photos = await PhotoService.getPhotos();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
