import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_2v0/color.dart';
import 'package:whatsapp_2v0/view/chatview.dart';

class FloatCount with ChangeNotifier {
  var iconMessage = Icons.message;
  setIcon(int value) {
    switch (value) {
      case 0:
        iconMessage = Icons.message;
        notifyListeners();
        break;
      case 1:
        iconMessage = Icons.camera_enhance;
        notifyListeners();
        break;
      case 2:
        iconMessage = Icons.phone;
        notifyListeners();
        break;
      default:
    }
  }
}

class Mobilelayout extends StatelessWidget {
  const Mobilelayout({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<FloatCount>();

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appBarColor,
            title: const Text(
              "WhatsApp",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: false,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.grey,
                  )),
            ],
            bottom:  TabBar(
              dividerHeight: 4,
              indicatorColor: tabColor,
              indicatorWeight: 4,
              unselectedLabelColor: Colors.grey,
              labelColor: tabColor,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              tabs: const [
                Tab(
                  text: "CHATS",
                ),
                Tab(
                  text: "STATUS",
                ),
                Tab(
                  text: "CALLS",
                ),
              ],
              onTap: (value) => appState.setIcon(value),
            ),
          ),
          body: const TabBarView(
            children: [ChatView(), Placeholder(), Placeholder()],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: tabColor,
            child: Icon(
              appState.iconMessage,
              color: Colors.white,
            ),
          ),
        ));
  }
}
