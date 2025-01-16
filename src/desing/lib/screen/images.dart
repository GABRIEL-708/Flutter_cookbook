import 'package:flutter/material.dart';

class ImagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actividades con Imagen y Fade-In'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú de Actividades',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Actividad con Imagen'),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BasicImageExample()),
                );
              },
            ),
            ListTile(
              title: const Text('Actividad con Fade-In'),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FadeInImageExample()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Selecciona una actividad desde el menú del drawer'),
      ),
    );
  }
}

// Clases de ejemplos
class BasicImageExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actividad con Imagen'),
      ),
      body: Center(
        child: Image.network(
          'https://picsum.photos/250?image=9',
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child; // Imagen cargada
            return const CircularProgressIndicator(); // Indicador de carga
          },
        ),
      ),
    );
  }
}

class FadeInImageExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actividad con Fade-In'),
      ),
      body: Center(
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/loading.gif', // Asegúrate de tener esta imagen
          image: 'https://picsum.photos/250?image=10',
        ),
      ),
    );
  }
}