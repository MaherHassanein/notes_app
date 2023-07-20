import 'package:flutter/material.dart';
import 'package:notes_app/costant/costant.dart';

class CustomTextButtom extends StatelessWidget {
  const CustomTextButtom({this.ontap});
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: KPrimaryColor,
        ),
        child: Center(
            child: Text(
          'Add',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
