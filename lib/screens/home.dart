import 'package:flutter/material.dart';
import 'package:workshop_navigations/components/image_tab.dart';
import 'package:workshop_navigations/screens/view_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Número de pestañas
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Tab 1"),
              Tab(text: "Tab 2"),
              Tab(text: "Tab 3"),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context); // Cierra el drawer
                  Navigator.pushReplacementNamed(
                      context, '/'); // Cambia a la página principal
                },
              ),
              ListTile(
                title: const Text('Second Screen'),
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
        ),
        body: const TabBarView(
          children: [
            Center(child: TabImage(title: 'Tab 1', tabIndex: 0)),
            Center(child: TabImage(title: 'Tab 2', tabIndex: 1)),
            Center(child: TabImage(title: 'Tab 3', tabIndex: 2)),
          ],
        ),
      ),
    );
  }
}
