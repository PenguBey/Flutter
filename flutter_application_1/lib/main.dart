import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(100, 0, 0, 250),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHome(),
      ),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const MyNumber();
      case 1:
        page = const MyFavorite();
      default:
        throw UnimplementedError(' $selectedIndex');
    }

    return Scaffold(
      body: Row(
        children: [
          SafeArea(
              child: NavigationRail(
            extended: false,
            destinations: const [
              NavigationRailDestination(
                  icon: Icon(Icons.home), label: Text("Home")),
              NavigationRailDestination(
                  icon: Icon(Icons.favorite), label: Text("Favorites")),
            ],
            selectedIndex: selectedIndex,
            onDestinationSelected: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
          )),
          Expanded(
              child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: page,
          ))
        ],
      ),
    );
  }
}

class MyState extends ChangeNotifier {
  int counter = 0;

  int cardColorR = 0;
  int cardColorB = 0;

  final List<int> eklenenler = <int>[];

  void incrementCounter() {
    counter++;
    if (cardColorR != 220) {
      cardColorR += 20;
    }
    notifyListeners();
  }

  void incrementCounterD() {
    counter--;
    if (cardColorB != 220) {
      cardColorB += 20;
    }
    notifyListeners();
  }

  void sayiEkle() {
    if (!eklenenler.contains(counter)) {
      eklenenler.add(counter);
    } else {
      eklenenler.remove(counter);
    }
    notifyListeners();
  }

  void sayiSil({required int index}) {
    eklenenler.removeAt(index);
    notifyListeners();
  }

  int row = 1;
  String selectedDrop = "1";
  void sayiSirala() {
    row = int.parse(selectedDrop);
    notifyListeners();
  }
}

class MyNumber extends StatelessWidget {
  const MyNumber({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var state = context.watch<MyState>();

    IconData icon;
    if (state.eklenenler.contains(state.counter)) {
      icon = Icons.check_box;
    } else {
      icon = Icons.check_box_outline_blank;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: Color.fromARGB(255, state.cardColorR, state.cardColorB, 150),
            child: Padding(
              padding: const EdgeInsets.all(100.0),
              child: Text(
                '${state.counter}',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: state.incrementCounter,
                  child: const Text("Arttır")),
              const SizedBox(width: 10),
              ElevatedButton(
                  onPressed: state.incrementCounterD,
                  child: const Text("Azalt")),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(onPressed: state.sayiEkle, child: Icon(icon)),
        ],
      ),
    );
  }
}

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<MyState>();

    state.eklenenler.sort((a, b) => a.compareTo(b));
    if (state.eklenenler.isEmpty) {
      return const Center(child: Text("Hiçbir sayı Eklemediniz"));
    }

    List<String> dropList = ["1", "2", "3", "4", "5", "6"];
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              DropdownMenu(
                initialSelection: state.selectedDrop,
                dropdownMenuEntries: dropList.map((String dropItem) {
                  return DropdownMenuEntry(value: dropItem, label: dropItem);
                }).toList(),
                onSelected: (String? value) {
                  state.selectedDrop = value as String;
                  state.sayiSirala();
                },
              ),
              NewWidget(state: state),
            ],
          ),
        ),
      ]),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.state,
  });

  final MyState state;

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        for (int x = 0; x < (state.eklenenler.length / state.row).ceil(); x++)
          TableRow(decoration: const BoxDecoration(), children: [
            for (int y = 0; y < state.row; y++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    state.sayiSil(index: (x * state.row) + y);
                  },
                  child: TableCell(
                    child: Center(
                      child: (x * state.row) + y < state.eklenenler.length
                          ? Text(
                              style: Theme.of(context).textTheme.displaySmall,
                              "${state.eklenenler[(x * state.row) + y]}")
                          : const Text(''),
                    ),
                  ),
                ),
              ),
          ]),
      ],
    );
  }
}
