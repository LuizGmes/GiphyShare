import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:giphy_share/common/app_colors/app_colors.dart';
import 'package:giphy_share/services/giphy_service.dart';
import 'package:giphy_share/ui/view_page.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  int _offset = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.PrimaryBackgroundColor,
        title: Image.asset("resources/images/logo_giphy.gif"),
        centerTitle: true,
      ),
      backgroundColor: AppColors.PrimaryBackgroundColor,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: "Pesquise Aqui",
                  labelStyle: TextStyle(color: AppColors.SecondaryBackgroundColor),
                  border: OutlineInputBorder()),
              style: TextStyle(color: AppColors.SecondaryBackgroundColor, fontSize: 18.0),
              textAlign: TextAlign.center,
              onSubmitted: (text){
                setState(() {
                  _search = text;
                  _offset = 0;
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future:  GiphyService.getGifs(_search, _offset),
                builder: (context,snapshot){
                  switch(snapshot.connectionState){
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Container(
                        width: 200.0,
                        height: 200.0,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(AppColors.SecondaryBackgroundColor),
                          strokeWidth: 5.0,
                        ),
                      );
                    default:
                      if(snapshot.hasError) return Container();
                      else return _createGifTable(context,snapshot);
                  }
                }
            ),
          )
        ],
      ),
    );
  }

  int _getCount(List data){
    if(_search == null){
      return data.length;
    }else{
      return data.length + 1;
    }
  }

  Widget _createGifTable(BuildContext context, AsyncSnapshot snapshot){
    return GridView.builder(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0
        ), 
        itemCount: _getCount(snapshot.data["data"]),
        itemBuilder: (context, index){
          if(_search == null || index < snapshot.data["data"].length) {
            return GestureDetector(
              child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: snapshot.data["data"][index]["images"]["fixed_height"]["url"],
                  height: 300.0,
                  fit: BoxFit.cover,
              ),
              onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPage(snapshot.data["data"][index])));
              },
              onLongPress: (){
                  Share.share(snapshot.data["data"][index]["images"]["fixed_height"]["url"]);
              },
            );
          }else{
            return Container(
              child: GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add, color: AppColors.SecondaryBackgroundColor, size: 70.0,),
                    Text("Mais Gifs...", style: TextStyle(color: AppColors.SecondaryBackgroundColor, fontSize: 22.0),)
                  ],
                ),
                onTap: (){
                  setState(() {
                    _offset += 19;
                  });
                },
              ),
            );
          }
        }
    );
  }

}