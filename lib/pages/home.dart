import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

class HomePage extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ความรู้เกี่ยวกับการฉีดวัคซีนโควิด"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
          builder: (context, snapshot) {
            var data = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return MyBox(data[index]['title'], data[index]['subtitle'], data[index]['imageurl'], data[index]['detail']);
              },
              itemCount: data.length,
            );
          },
          future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
        )
      ),
    );
  }

  Widget MyBox(String title, String subtitle, String imageUrl, String detail) {
    return Container(
      height: 150,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.60), BlendMode.darken)
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            color: Color.fromRGBO(0, 0, 0, 0.3),
            spreadRadius: 0,
            offset: Offset(3,3)
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Text(subtitle, style: TextStyle(fontSize: 15, color: Colors.white,),),
          SizedBox(height: 18,),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(title, subtitle, imageUrl, detail)));
            }, 
            child: Text("อ่านต่อ...")
          )
        ],
      ),
    );
  }

}