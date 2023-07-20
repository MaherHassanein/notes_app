import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_listview.dart';
import 'package:notes_app/widgets/custom_textfield.dart';

class AddNoteButtom extends StatelessWidget {
  const AddNoteButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          hint: 'Title',
        ),
        SizedBox(
          height: 15,
        ),
        CustomTextField(
          hint: 'Content',
          maxlines: 5,
        ),
      ],
    );
  }
}
