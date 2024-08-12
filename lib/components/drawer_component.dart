import 'package:flutter/material.dart';
import 'package:workshop_navigations/screens/view_image.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 33, 166, 243),
            ),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Anime Workshop Navigations',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          if (ModalRoute.of(context)?.settings.name != '/')
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
            ),
          ListTile(
            title: const Text(
              'Viewer Image',
              style: TextStyle(
                color: Color.fromARGB(255, 58, 59, 59),
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: const Icon(Icons.image),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ViewImage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
