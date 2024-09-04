import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizzería Bella Napoli',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: false,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Pizzas'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.local_pizza),
                  label: Text('Favoritos'),
                ),
              ],
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: _getSelectedPage(_selectedIndex),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getSelectedPage(int index) {
    switch (index) {
      case 0:
        return const PizzaHomePage(); // Página para seleccionar tipo de pizza
      case 1:
        return const PizzaPage(); // Página de favoritos
      default:
        return const PizzaHomePage();
    }
  }
}

class PizzaHomePage extends StatelessWidget {
  const PizzaHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/logo.png', 
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          
        ],
      ),
    );
  }
}

class PizzaPage extends StatefulWidget {
  const PizzaPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PizzaPageState createState() => _PizzaPageState();
}

class _PizzaPageState extends State<PizzaPage> {
  String? _selectedOption;
  String? _selectedIngrediente;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          const Text(
            'Seleccione una opción:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio<String>(
                value: 'Vegetariana',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value;
                    _selectedIngrediente = null; // Resetear ingrediente al cambiar opción
                  });
                },
              ),
              const Text('Vegetariana'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio<String>(
                value: 'No Vegetariana',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value;
                    _selectedIngrediente = null;
                  });
                },
              ),
              const Text('No Vegetariana'),
            ],
          ),
          if (_selectedOption != null)
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                '¿Cuál ingrediente deseas?',
                style: TextStyle(fontSize: 16),
              ),
            ),
          // Ingredientes para opciones vegetarianas
          if (_selectedOption == 'Vegetariana') ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  value: 'Pimiento',
                  groupValue: _selectedIngrediente,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedIngrediente = value;
                    });
                  },
                ),
                const Text('Pimiento'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  value: 'Tofu',
                  groupValue: _selectedIngrediente,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedIngrediente = value;
                    });
                  },
                ),
                const Text('Tofu'),
              ],
            ),
          ],
          // Ingredientes para opciones no vegetarianas
          if (_selectedOption == 'No Vegetariana') ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  value: 'Peperoni',
                  groupValue: _selectedIngrediente,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedIngrediente = value;
                    });
                  },
                ),
                const Text('Peperoni'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  value: 'Jamón',
                  groupValue: _selectedIngrediente,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedIngrediente = value;
                    });
                  },
                ),
                const Text('Jamón'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  value: 'Salmón',
                  groupValue: _selectedIngrediente,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedIngrediente = value;
                    });
                  },
                ),
                const Text('Salmón'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  value: 'Salchicha Italiana',
                  groupValue: _selectedIngrediente,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedIngrediente = value;
                    });
                  },
                ),
                const Text('Salchicha Italiana'),
              ],
            ),
          ],
          // Mostrar el ingrediente seleccionado
          if (_selectedIngrediente != null)
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column( // Se añadió un Column aquí para organizar los widgets correctamente
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Tu pizza $_selectedOption llevará Mozzarella, Tomate y $_selectedIngrediente.',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para pedir la pizza
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Confirmación'),
                            content: const Text('¡Tu pizza ha sido ordenada exitosamente!'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('Ordenar Pizza'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}