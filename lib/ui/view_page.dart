import 'package:flutter/material.dart';
import 'package:giphy_share/common/app_colors/app_colors.dart';
import 'package:share/share.dart';

class ViewPage extends StatelessWidget {

  final Map _gifData;

  ViewPage(this._gifData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_gifData["title"]),
        backgroundColor: AppColors.PrimaryBackgroundColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){
              Share.share(_gifData["images"]["fixed_height"]["url"]);
            },
          )
        ],
      ),
      backgroundColor: AppColors.PrimaryBackgroundColor,
      body: Center(
        child: Image.network(_gifData["images"]["fixed_height"]["url"]),
      ),
    );
  }
}
