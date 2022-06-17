import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_calls/post_client.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}


class _HomepageState extends State<Homepage> {
  final PostClass _postClass = PostClass();

  @override
  void initState() {
    super.initState();
    _postClass.fetchPost(1);
  }

  String? postTitle;
  String? postBody;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Networking'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          onPressed: () async {
            final post = await _postClass.fetchPost(1);
            setState(() {
              postTitle = post.title;
              postBody = post.body;
            });
          },

          child: const Text('GET'),
        ),
      ),
    );
  }
}