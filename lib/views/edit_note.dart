import 'package:flutter/material.dart';
import 'package:notes_app/widgets/edit_notes_body.dart';

import '../modal/notes_modal.dart';

class EditNote extends StatelessWidget {
  const EditNote({required this.note1});
  final NotesModal note1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNotesBody(
        note2: note1,
      ),
    );
  }
}
