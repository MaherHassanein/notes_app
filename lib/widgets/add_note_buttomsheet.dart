import 'package:flutter/material.dart';
import 'package:notes_app/add_note_cubit/cubit/notescubit/notes_cubit.dart';
import 'package:notes_app/widgets/add_note_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/add_note_cubit/cubit/addnote_cubit.dart';

class AddNoteButtom extends StatelessWidget {
  const AddNoteButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddnoteCubit(),
      child: BlocConsumer<AddnoteCubit, AddnoteState>(
        listener: (context, state) {
          if (state is AddnoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNote();
            Navigator.pop(context);
          }

          if (state is AddnoteFailure) {}
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddnoteLoading ? true : false,
            child: AddNoteForm(),
          );
        },
      ),
    );
  }
}
