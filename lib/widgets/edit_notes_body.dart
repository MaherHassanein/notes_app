import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_textfield.dart';

import 'custom_appbar.dart';

class EditNotesBody extends StatelessWidget {
  const EditNotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 35),
          CustomAppBar(title: 'Edit Notes', icon: Icons.check),
          SizedBox(
            height: 35,
          ),
          CustomTextField(hint: 'Title'),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            hint: 'content',
            maxlines: 7,
          ),
        ],
      ),
    );
  }
}
