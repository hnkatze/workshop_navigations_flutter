import 'package:flutter/material.dart';

class ImageProviderModel with ChangeNotifier {
  List<String> _imageUrls = [
    'https://images8.alphacoders.com/135/thumb-1920-1350086.jpeg',
    'https://images5.alphacoders.com/134/thumb-1920-1345309.jpeg',
    'https://images5.alphacoders.com/481/thumb-1920-481903.png',
  ];
  List<int> _imageNumbers = [];
  int _selectedImageNumber = 1;

  void setImages(List<String> imageUrls, List<int> imageNumbers) {
    _imageUrls = imageUrls;
    _imageNumbers = imageNumbers;
    _selectedImageNumber = _imageNumbers.isNotEmpty ? _imageNumbers[0] : 1;
    notifyListeners();
  }

  String getImageUrlByNumber(int number) {
    final index = _imageNumbers.indexOf(number);
    if (index != -1 && index < _imageUrls.length) {
      return _imageUrls[index];
    }
    return 'https://images8.alphacoders.com/135/thumb-1920-1350086.jpeg'; // Retorna una cadena vacía si el número no es válido
  }

  int getImageCount() {
    return _imageUrls.length;
  }

  void updateSelectedImageNumber(int number) {
    _selectedImageNumber = number;
    notifyListeners();
  }

  String get selectedImageUrl => getImageUrlByNumber(_selectedImageNumber);
}
