import 'package:flutter/material.dart';
import 'package:whatsapp_2v0/color.dart';
import 'package:whatsapp_2v0/info.dart';

class PersonChat extends StatelessWidget {
  const PersonChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(info[0]["name"].toString()),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.video_call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
    );
  }
}
