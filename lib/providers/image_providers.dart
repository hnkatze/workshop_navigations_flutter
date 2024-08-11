import 'package:flutter/material.dart';

class ImageProviderModel with ChangeNotifier {
  List<String> _imageUrls = [
    'https://images8.alphacoders.com/135/thumb-1920-1350086.jpeg',
    'https://images5.alphacoders.com/134/thumb-1920-1345309.jpeg',
    'https://images5.alphacoders.com/481/thumb-1920-481903.png',
  ];

  int _selectedImageNumber = 0;

  void setImages(List<String> imageUrls) {
    _imageUrls = imageUrls;
    notifyListeners();
  }

  String getImageUrlByNumber(int number) {
    // Verificación para evitar errores de índice
    if (number >= 0 && number < _imageUrls.length) {
      return _imageUrls[number];
    }
    // Retorna una imagen por defecto o un mensaje de error si el índice no es válido
    return 'https://example.com/default-image.png';
  }

  int getImageCount() {
    return _imageUrls.length;
  }

  void updateSelectedImageNumber(int number) {
    if (number >= 0 && number < _imageUrls.length) {
      _selectedImageNumber = number;
      notifyListeners();
    } else {
      print('Índice fuera de rango: $number');
    }
  }

  String get selectedImageUrl => getImageUrlByNumber(_selectedImageNumber);
}
