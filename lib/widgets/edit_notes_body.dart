import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/add_note_cubit/cubit/notescubit/notes_cubit.dart';
import 'package:notes_app/widgets/custom_textfield.dart';

import '../modal/notes_modal.dart';
import 'custom_appbar.dart';

class EditNotesBody extends StatefulWidget {
  const EditNotesBody({required this.note2});
  final NotesModal note2;

  @override
  State<EditNotesBody> createState() => _EditNotesBodyState();
}

class _EditNotesBodyState extends State<EditNotesBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 35),
          CustomAppBar(
            onpressed: () {
              widget.note2.title = title ?? widget.note2.title;
              widget.note2.subtitle = content ?? widget.note2.subtitle;
              widget.note2.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNote();
              Navigator.pop(context);
            },
            title: 'Edit Notes',
            icon: Icons.check,
          ),
          SizedBox(
            height: 35,
          ),
          CustomTextField(
            onchange: (data) {
              title = data;
            },
            hint: widget.note2.title,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            onchange: (data) {
              content = data;
            },
            hint: widget.note2.subtitle,
            maxlines: 7,
          ),
        ],
      ),
    );
  }
}
