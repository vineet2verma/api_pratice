import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClient;

import '../models/model_todo.dart';

class MyToDoPage extends StatefulWidget {
  const MyToDoPage({super.key});

  @override
  State<MyToDoPage> createState() => _MyToDoPageState();
}

class _MyToDoPageState extends State<MyToDoPage> {
  ToDoMainModel? todomainmodel;

  Future<void> getData() async{
    var uri = Uri.parse("https://dummyjson.com/todos");
    var resp = await httpClient.get(uri);

    if(resp.statusCode == 200){
      var mData = jsonDecode(resp.body);
      todomainmodel = ToDoMainModel.fromJson(mData);
      setState(() { });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do Api"),
        centerTitle: true,
      ),
      body: todomainmodel != null && todomainmodel!.toDos!.isNotEmpty?
      ListView.builder(
        // itemCount: todomainmodel!.toDos!.length,
        itemBuilder: (context, index) {


          },
      ): Container(child: Center(child: Text("Check Data")),)
    );

  }

}
