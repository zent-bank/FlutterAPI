import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  
  final title,subtitle,imageurl,detail;
  DetailPage(this.title, this.subtitle, this.imageurl, this.detail);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String _title = "";
  String _subtitle = "";
  String _imageurl = "";
  String _detail = "";

  @override
  void initState() {
    super.initState();
    _title = widget.title;
    _subtitle = widget.subtitle;
    _imageurl = widget.imageurl;
    _detail = widget.detail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(_title, style: TextStyle(fontSize: 30)),
            SizedBox(height: 10,),
            Text(_subtitle, style: TextStyle(fontSize: 20, color: Colors.grey)),
            SizedBox(height: 10,),
            Image.network(_imageurl),
            SizedBox(height: 10,),
            Text(_detail)
          ],
        ),
      )
    );
  }
}