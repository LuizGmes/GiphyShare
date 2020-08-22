import 'package:flutter/material.dart';
import 'package:giphy_share/common/app_colors/app_colors.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(
        top: 50
      ),
      onPressed: (){
        showDialog(context: context,
          builder: (context){
            return AlertDialog(
              title: Text("Funcionalidade Não Implementada!"),
              content: Text("Desculpe, ainda estamos em precesso de desenvolvimento."),
              actions: <Widget>[
                FlatButton(
                  child: Text("Ok"),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                )
              ],
            );
          }
        );
      },
      child: Text(
        "Primeira vêz por aqui? Cadastre-se!",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: AppColors.SecondaryBackgroundColor,
          fontSize: 12,
          letterSpacing: 0.5
        ),
      ),
    );
  }
}
