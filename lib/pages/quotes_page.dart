import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/model_quote.dart';

class MyQuotesPage extends StatefulWidget {
  @override
  State<MyQuotesPage> createState() => _MyQuotesPageState();
}

class _MyQuotesPageState extends State<MyQuotesPage> {
  DataModel? Quotes;

  Future<void> getdata() async{
    var uri = Uri.parse("https://dummyjson.com/quotes");
    var resp = await http.get(uri);
    // print("code ${resp.statusCode}");
    // print("body${resp.body}");
    if(resp.statusCode==200){
      var mData = jsonDecode(resp.body);
      Quotes = DataModel.fromJson(mData);
      setState(() { });
      // print(Quotes!.quotes.length);
    }
  }

  @override
  void initState(){
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Pratice 1"),
        centerTitle: true,
      ),
      body: Quotes !=null && Quotes!.quotes.isNotEmpty ?

      ListView.builder(
        itemCount: Quotes!.quotes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              child: ListTile(
                // leading: Text("${dataModel!.quotes[index].id}"),
                leading: Text("${Quotes!.quotes[index].id}"),
                // title: Text("${dataModel!.quotes[index].quote }"),
                title: Text("${Quotes!.quotes[index].quote }"),
                subtitle: Text("${Quotes!.quotes[index].author }"),
              ),
            ),
          );
          },
      ):Container(child: Center(child: Text("Check Data",style: TextStyle(fontSize: 31),))),
    );
  }
}
