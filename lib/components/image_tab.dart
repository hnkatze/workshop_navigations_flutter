import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop_navigations/providers/image_providers.dart';

class TabImage extends StatefulWidget {
  final String title;

  const TabImage({required this.title, super.key});

  @override
  _TabImageState createState() => _TabImageState();
}

class _TabImageState extends State<TabImage> {
  int selectedImage = 1;
  String? imageUrl;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final imageProvider =
          Provider.of<ImageProviderModel>(context, listen: false);
      setState(() {
        imageUrl = imageProvider.getImageUrlByNumber(selectedImage);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageProviderModel>(context);
    int imageCount = imageProvider.getImageCount();

    return Column(children: [
      Text(widget.title, style: Theme.of(context).textTheme.titleLarge),
      if (imageUrl != null)
        Image.network(imageUrl!, width: 300, height: 300)
      else
        const CircularProgressIndicator(), // Puedes mostrar un indicador de carga mientras se obtiene la URL
      DropdownButton<int>(
        items: [
          for (int i = 1; i <= imageCount; i++)
            DropdownMenuItem<int>(
              value: i,
              child: Text(' $i'),
            )
        ],
        value: selectedImage,
        onChanged: (int? value) {
          if (value != null) {
            setState(() {
              selectedImage = value;
              imageUrl = imageProvider.getImageUrlByNumber(selectedImage);
            });
          }
        },
      )
    ]);
  }
}
