import 'package:flutter/material.dart';
import 'package:giphy_share/common/app_colors/app_colors.dart';

class ImputField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData icon;

  ImputField({this.hint,this.obscure,this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.SecondaryBackgroundColor,
            width: 0.5,
          )
        )
      ),
      child: TextFormField(
        obscureText: obscure,
        style: TextStyle(color: AppColors.SecondaryBackgroundColor),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: AppColors.SecondaryBackgroundColor,
          ),

          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            color: AppColors.SecondaryBackgroundColor,
            fontSize: 18,
          ),
          contentPadding: EdgeInsets.only(
            top: 30,
            right: 30,
            bottom: 30,
            left: 5
          )
        ),
      ),
    );
  }
}
