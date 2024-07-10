import 'package:flutter/material.dart';
import 'package:whatsapp_2v0/color.dart';
import 'package:whatsapp_2v0/info.dart';
import 'package:whatsapp_2v0/view/peronchatview.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
          itemCount: info.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PersonChat()));},
                  child: ListTile(
                    title: Text(
                      info[index]["name"].toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        info[index]["message"].toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(info[index]["profilePic"].toString()),
                    ),
                    trailing: Text(
                      info[index]["time"].toString(),
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ),
                ),
                const Divider(
                  color: dividerColor,
                  indent: 85,
                  endIndent: 43,
                  thickness: 2,
                )
              ],
            );
          }),
    );
  }
}
