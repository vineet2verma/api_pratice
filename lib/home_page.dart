import 'dart:convert';
import 'package:api_1jan/models/model_todo.dart';
import 'package:api_1jan/pages/product_page.dart';
import 'package:api_1jan/pages/quotes_page.dart';
import 'package:api_1jan/pages/todo_page.dart';
import 'package:api_1jan/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Pratice"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                            return MyQuotesPage();
                          }));
                },
                child: Text("Quotes Api",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return MyToDoPage();
                    }));
                },
                child: Text("ToDo Api",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return MyProductPage();
                    }));
                },
                child: Text("Product Api",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return MyUserPage();
                    }));
                },
                child: Text("User Api",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold)),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
