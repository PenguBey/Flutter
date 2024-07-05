import 'package:flutter/material.dart';
import 'package:rest/models/post.dart';
import 'package:rest/service/remote_service.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }
  getData() async {
    posts = await RemoteService().getPosts();
    if(posts != null){
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("RestTest")),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
          return Container(
            child: Text("${posts?[index].title}"),
          );
          
        }),
        replacement: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
