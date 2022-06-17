import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_calls/post.dart';

class PostClass {
  //TODO: Define methods for network requests
  static const baseUrl = 'https://jsonplaceholder.typicode.com';
  static const postsEndpoints = '$baseUrl/posts';

  Future<Post> fetchPost(int postId) async {
    debugPrint('sending network');
    final url = Uri.parse('$postsEndpoints/$postId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post: $postId');
    }

  }

  Future<Post> createPost(String title, String body) async {
    final url = Uri.parse(postsEndpoints);
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({'title': title, 'body': body}));

    if (response.statusCode == 201) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create post');
    }
  }

  Future<Post> updatePost(int postId, String title, String body) async {
    final url = Uri.parse(postsEndpoints + '/$postId');
    final response = await http.put(url,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({'title': title, 'body': body}));

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update post');
    }

    }

  Future<Post> deletePost(int postId) async {
    final url = Uri.parse(postsEndpoints + '/$postId');
    final response = await http.delete(url,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},);

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete post: $postId');
    }

  }
}
