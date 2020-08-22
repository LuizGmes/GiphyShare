import 'package:flutter/material.dart';
import 'package:giphy_share/common/components/fields/imput_field.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        child: Column(
          children: <Widget>[
            ImputField(
              hint: "Username",
              obscure: false,
              icon: Icons.person_outline,
            ),
            ImputField(
              hint: "Password",
              obscure: true,
              icon: Icons.lock_outline,
            )
          ],
        ),
      ),
    );
  }
}

