import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:whatsapp/models/chatmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  IconData fabIcon = Icons.message;
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, initialIndex: 1, length: 4)
      ..addListener(() {
        setState(() {
          switch (tabController.index) {
            case 0:
              break;
            case 1:
              fabIcon = Icons.message;
              break;
            case 2:
              fabIcon = Icons.camera_enhance;
              break;
            case 3:
              fabIcon = Icons.call;
              break;
          }
        });
      });
  }

  List<ChatModel> chatList = [
    ChatModel("Ömer", "HeyDostum", "11/11/2018"),
    ChatModel("Sadık", "Hey", "11/10/2018"),
    ChatModel("Ali", "Dostum", "11/01/2018"),
    ChatModel("Kaşif", "HeyDo", "10/11/2018"),
    ChatModel("Ali", "Dostum", "11/01/2018"),
    ChatModel("Kaşif", "HeyDo", "10/11/2018"),
    ChatModel("Ali", "Dostum", "11/01/2018"),
    ChatModel("Kaşif", "HeyDo", "10/11/2018"),
    ChatModel("Kaşif", "HeyDo", "10/11/2018"),
    ChatModel("Ali", "Dostum", "11/01/2018"),
    ChatModel("Kaşif", "HeyDo", "10/11/2018"),
    ChatModel("Ali", "Dostum", "11/01/2018"),
    ChatModel("Kaşif", "HeyDo", "10/11/2018"),
    ChatModel("Ahmet", "eyasdasdasasdasdasddsaos", "01/11/2018")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 7, 94, 84),
          title: const Text(
            "WhatsApp",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w600),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(Icons.more_vert),
            ),
          ],
          actionsIconTheme: IconThemeData(color: Colors.white54),
          bottom: TabBar(
            tabs: const [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                child: Text('CHAT'),
              ),
              Tab(
                child: Text('STATUS '),
              ),
              Tab(
                child: Text('CALL'),
              ),
            ],
            labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.3),
            unselectedLabelColor: Colors.white70,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            controller: tabController,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(fabIcon),
          backgroundColor: Color.fromARGB(255, 37, 211, 102),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Icon(Icons.camera_alt),
            Chat(chatList: chatList),
            Placeholder(),
            Placeholder(),
          ],
        ));
  }
}

class Chat extends StatelessWidget {
  const Chat({
    super.key,
    required this.chatList,
  });

  final List<ChatModel> chatList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, item) {
          ChatModel chat = chatList[item];
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: 64.0,
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                chat.Name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                              Text(
                                chat.MessageDate,
                                style: TextStyle(color: Colors.black45),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.0),
                            child: Text(
                              chat.MostRecentMessage,
                              style:
                                  TextStyle(color: Colors.black45, fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),Divider(color: Colors.black12,indent: 60,endIndent: 60,height: 10,)
            ],
          );
        });
  }
}
