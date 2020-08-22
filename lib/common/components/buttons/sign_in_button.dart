import 'package:flutter/material.dart';
import 'package:giphy_share/common/app_colors/app_colors.dart';
import 'package:giphy_share/ui/home_page.dart';

class SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(top: 50),
      onPressed: (){
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context)=>HomePage()
            )
        );
      },
      child: Container(
        width: 320,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.SecondaryBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(30.0))
        ),
        child: Text(
          "Sign in",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w300,
              color: AppColors.PrimaryBackgroundColor,
              fontSize: 20,
              letterSpacing: 0.3
          ),
        ),
      )
    );
  }
}
