import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

import 'package:project/src/model/post.dart';

String url = 'https://jsonplaceholder.typicode.com/posts';
Uri uri ;

Future<List<Post>> getAllPosts() async {
  uri = Uri.parse(url);
  final response = await http.get(uri);
  print(response.body);
  return allPostsFromJson(response.body);
}

Future<Post> getPost() async {
  uri = Uri.parse('$url/1');
  final response = await http.get(uri);
  return postFromJson(response.body);
}

Future<http.Response> createPost(Post post) async {
  uri = Uri.parse('$url');
  final response = await http.post(uri,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: ''
      },
      body: postToJson(post));
  return response;
}
//
//Future<Post> createPost(Post post) async{
//  final response = await http.post('$url',
//      headers: {
//        HttpHeaders.contentTypeHeader: 'application/json'
//      },
//      body: postToJson(post)
//  );
//
//  return postFromJson(response.body);
//}
