import 'package:flutter/material.dart';
import 'package:users/model/userModel.dart';
import 'package:users/service/localService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  List<User>? users;
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    users = await LocalService().getUsers();
    if (users != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Visibility(
          visible: isLoaded,
          replacement: const Center(child: CircularProgressIndicator(),),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 500,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          
                          decoration: const InputDecoration(
                              labelText: "KullaniciAdi",
                              icon: Icon(Icons.person)),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: "Şifre", icon: Icon(Icons.person)),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: "İsmi", icon: Icon(Icons.person)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () => print(""),
                                child: const Text("kaydet")),
                            ElevatedButton(
                                onPressed: () => print(""),
                                child: const Text("Sil"))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Table(
                      children: [
                        for (var i in users!)
                          TableRow(children: [
                            TableCell(child: Text(i.name)),
                            TableCell(child: Text(i.userName)),
                            TableCell(child: Text(i.passWord))
                          ]),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
