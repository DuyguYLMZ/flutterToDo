import 'package:flutter/material.dart';
import 'package:project/src/view/homepage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        home: Homepage());
  }
}

/*
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
FutureBuilder<Post>(
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
)*/
