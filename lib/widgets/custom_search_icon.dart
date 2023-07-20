import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.05),
      ),
      height: 50,
      width: 50,
      child: Center(
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              size: 30,
            )),
      ),
    );
  }
}
