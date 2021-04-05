import 'package:flutter/material.dart';
import 'package:project/service/post_service.dart';
import 'package:project/service/task_service.dart';

import 'model/post.dart';

void main() {
  runApp(MyApp());
  loadTask();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  /*    title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),*/
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
/*  callAPI(){
    Post post = Post(
        body: 'Testing body body body',
        title: 'Flutter jam6'
    );
    createPost(post).then((response){
      if(response.statusCode > 200)
        print(response.body);
      else
        print(response.statusCode);
    }).catchError((error){
      print('error : $error');
    });
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body : FutureBuilder<Post>(
            future: getPost(),
            builder: (context, snapshot) {
            //  callAPI();
              if(snapshot.connectionState == ConnectionState.done) {

                if(snapshot.hasError){
                  return Text("Error");
                }

                return Text('Title from Post JSON : ${snapshot.data.title}');

              }
              else
                return CircularProgressIndicator();
            }
        )
    );
  }
}
