import 'package:flutter/material.dart';

import 'custom_item.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (contex, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: CustomItem(),
        );
      },
    );
  }
}
