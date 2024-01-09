
import 'dart:convert';

import 'package:api_1jan/models/model_user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClient;

class MyUserPage extends StatefulWidget {
  // const MyWallPaperPage({super.key});

  @override
  State<MyUserPage> createState() => _MyUserPageState();
}

class _MyUserPageState extends State<MyUserPage> {
  UsersDataModel? usersDataModel;
  
  Future<void> getData() async{
    var uri = Uri.parse("https://dummyjson.com/users");
    var resp = await httpClient.get(uri);

    if(resp.statusCode == 200){
      var mdata = jsonDecode(resp.body);
      usersDataModel = UsersDataModel.fromJson(mdata);
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
        title: Text("User Api"),
        centerTitle: true,
      ),
      body: usersDataModel !=null && usersDataModel!.users!.isNotEmpty
          ? ListView.builder(
        itemCount: usersDataModel!.users!.length,
        itemBuilder: (context, index) {
            UsersModel apidata = usersDataModel!.users![index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return UserProfilePage(apiData: apidata);
                    },));
                  },

                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2,color: Colors.black,),
                  borderRadius: BorderRadius.circular(21),
                ),
                leading: Text(apidata.id.toString()),
                title: Text("Name : ${apidata.firstName}"),
                subtitle: Text("Email : ${apidata.email}"),

              ),
            );
          }, )

          : Container(child: Center(child: CircularProgressIndicator(),),),
    );
  }
}


class UserProfilePage extends StatefulWidget {
  UsersModel apiData;
  UserProfilePage({super.key, required this.apiData });

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            userDetail(),
            personalDetail(),
          ],
        ),

      ),
    );
  }
  userDetail(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Divider(),
          customProfileDetailRow(name: 'Phone Number : ', path: widget.apiData.phone ),
          const Divider(),
          customProfileDetailRow(name: "Email :", path: widget.apiData.email),
          const Divider(),
          customProfileDetailRow(name: "Password", path: widget.apiData.password),
        ],
      ),
    );
  }

  ExpansionTile personalDetail(){
    return
        myExpensionView(
            [Column(
              children: [
                customProfileDetailRow(
                    name: "Name : ",
                    path: "${widget.apiData.firstName!} ${widget.apiData.lastName!} " ),
                Divider(),
                customProfileDetailRow(
                    name: "University",
                    path: "${widget.apiData.university}"
                ),
                Divider(),
                customProfileDetailRow(
                    name: "Gender",
                    path: "${widget.apiData.gender}"
                ),
                Divider(),
                customProfileDetailRow(
                    name: "Age",
                    path: "${widget.apiData.age}"
                ),
                // Divider(),
                customProfileDetailRow(
                    name: "Birth Date",
                    path: "${widget.apiData.birthDate}"
                ),
                // Divider(),
                customProfileDetailRow(
                    name: "Blood Group",
                    path: "${widget.apiData.bloodGroup}"
                ),
              ],
            )],
            "Personal Details" );
  }

  ExpansionTile myExpensionView(List<Widget> childs,String name){
    return ExpansionTile(

      shape: RoundedRectangleBorder(
        side: BorderSide(width: 4,color: Colors.black),
        borderRadius: BorderRadius.circular(21),
      ),
      controller: ExpansionTileController(),
      expandedCrossAxisAlignment:  CrossAxisAlignment.start,
      expandedAlignment: Alignment.topLeft,
      title: Text(name,style: TextStyle(fontWeight: FontWeight.bold),),
      children: childs,
    );
  }

  address(){}

  companyDeail(){}

  bankDetail(){}

  technicalDeail(){}

  customProfileDetailRow({required String name, required var path}){
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name.toString(), style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
          Text(path.toString(), style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
        ],
      ),
    );
  }
}
