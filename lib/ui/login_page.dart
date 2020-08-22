import 'package:flutter/material.dart';
import 'package:giphy_share/common/app_colors/app_colors.dart';
import 'package:giphy_share/common/components/buttons/sign_in_button.dart';
import 'package:giphy_share/common/components/buttons/sign_up_button.dart';
import 'package:giphy_share/common/components/forms/login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryBackgroundColor,
      appBar: AppBar(
        title: Text("Giphy Share"),
        backgroundColor: AppColors.PrimaryBackgroundColor,
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Column(
                children: <Widget> [
                  Padding(
                    padding: EdgeInsets.only(top: 70,bottom: 30),
                    child: Image.asset("resources/images/icon_giphy.png",
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                  LoginForm(),
                  SignInButton(),
                  SignUpButton()
                ]
            )
          ],
        ),
      ),
    );
  }
}
