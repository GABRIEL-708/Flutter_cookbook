import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: const DesignScreen(), // DesignScreen es la pantalla principal
    );
  }
}

class DesignScreen extends StatelessWidget {
  const DesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Design Section'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navega a MyHomePage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Drawer Demo')),
            );
          },
          child: const Text('Go to Home Screen'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const Text(
      'Bienvenido',
      style: optionStyle,
    ),
    const Text(
      'Correano',
      style: optionStyle,
    ),
    const Text(
      'Chaquet',
      style: optionStyle,
    ),
    SnackBarpage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('SnackBar'),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Orientation Grid'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrientationGridPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Custom Theme Page'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomThemePage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('TabBar Page'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TabBarPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


class SnackBarpage extends StatefulWidget {
  const SnackBarpage({super.key});

  @override
  State<SnackBarpage> createState() => _SnackBarpageState();
}

class _SnackBarpageState extends State<SnackBarpage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text('This is a snackbar'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Show SnackBar'),
      ),
    );
  }
}

class OrientationGridPage extends StatelessWidget {
  const OrientationGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orientation Grid'),
      ),
      body: Container(
        color: Colors.blue, // Fondo azul
        child: OrientationBuilder(
          builder: (context, orientation) {
            return GridView.count(
              // 2 columnas en vertical, 3 en horizontal
              crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
              // Genera 100 widgets que muestran su índice
              children: List.generate(100, (index) {
                return Center(
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    color: Colors.white, // Fondo blanco para los ítems
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}

class CustomThemePage extends StatelessWidget {
  const CustomThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Theme Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Texto con Raleway Regular',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 24,
                fontWeight: FontWeight.normal,
              ),
            ),
            const Text(
              'Texto con Raleway Italic',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 24,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Text(
              'Texto con RobotoMono Regular',
              style: TextStyle(
                fontFamily: 'RobotoMono',
                fontSize: 24,
                fontWeight: FontWeight.normal,
              ),
            ),
            const Text(
              'Texto con RobotoMono Bold',
              style: TextStyle(
                fontFamily: 'RobotoMono',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink, // Color del botón
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TabBarPage extends StatelessWidget {
  const TabBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Número de pestañas
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Demo'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)), // Pestaña 1
              Tab(icon: Icon(Icons.directions_transit)), // Pestaña 2
              Tab(icon: Icon(Icons.directions_bike)), // Pestaña 3
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Icon(Icons.directions_car)), // Contenido de la pestaña 1
            Center(child: Icon(Icons.directions_transit)), // Contenido de la pestaña 2
            Center(child: Icon(Icons.directions_bike)), // Contenido de la pestaña 3
          ],
        ),
      ),
    );
  }
}