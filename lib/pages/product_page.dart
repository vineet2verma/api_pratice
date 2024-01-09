import 'dart:convert';
import 'package:api_1jan/models/model_product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpclient;

class MyProductPage extends StatefulWidget {
  // const MyProductPage({super.key});

  @override
  State<MyProductPage> createState() => _MyProductPageState();
}

class _MyProductPageState extends State<MyProductPage> {
  ProductDataModel? productdatamodel;

  Future<void> getData() async{
    var url = Uri.parse("https://dummyjson.com/products");
    var resp = await httpclient.get(url);

    if(resp.statusCode == 200){
      var mdata = jsonDecode(resp.body);
      productdatamodel = ProductDataModel.fromJson(mdata);
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
        title: Text("Product Api"),
        centerTitle: true,
      ),
      body: productdatamodel !=null && productdatamodel!.products!.isNotEmpty?
      ListView.builder(
        itemCount: productdatamodel!.products!.length,
        itemBuilder: (context, index) {
          var apidata = productdatamodel!.products![index];
          return
              InkWell(
                onTap: () {
                  return print(apidata.id);
                },
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100 ,
                      decoration: BoxDecoration(
                       image: DecorationImage(image: NetworkImage(apidata.thumbnail.toString()))
                      ),
                    ),
                    Flexible(
                      child: ListTile(
                        title: Text(apidata.title.toString()),
                        subtitle: Text(apidata.brand.toString()),
                        trailing: Text(apidata.price.toString()),


                      ),
                    ),

                  ],
                ),
              );


      }, ) :
      Container(child: Center(child: Text("Check Data")),),

    );
  }
}
