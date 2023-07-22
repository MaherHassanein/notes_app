import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/add_note_cubit/cubit/notescubit/notes_cubit.dart';
import 'package:notes_app/modal/notes_modal.dart';

import 'custom_item.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NotesModal> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (contex, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: CustomItem(note: notes[index]),
              );
            },
          ),
        );
      },
    );
  }
}
