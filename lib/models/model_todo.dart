import 'package:flutter/material.dart';

class ToDoMainModel {
  int? limit;
  int? skip;
  List<ToDoSubModel>? toDos;
  int? total;

  ToDoMainModel({
    required this.limit,
    required this.skip,
    required this.toDos,
    required this.total });

  factory ToDoMainModel.fromJson(Map<String,dynamic> json){
    List<ToDoSubModel> listtoDoData = [];
    for(Map<String,dynamic> eachMap in json['toDos']){
      var todos = ToDoSubModel.fromJson(eachMap);
      listtoDoData.add(todos);
    }
    return ToDoMainModel(
        limit : json['limit'],
        skip: json['skip'],
        toDos : listtoDoData,
        total : json['total']);
  }
}

class ToDoSubModel {
  bool? completed;
  int? id;
  String? todo;
  int? userId;

  ToDoSubModel({required this.completed, required this.id, required this.todo, required this.userId});

  factory ToDoSubModel.fromJson(Map<String,dynamic> json){
    return ToDoSubModel(
      completed : json['completed'],
      id : json['id'],
      todo : json['todo'],
      userId : json['userId'] );
  }
}


