import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/costant/costant.dart';

import '../../modal/notes_modal.dart';

part 'addnote_state.dart';

class AddnoteCubit extends Cubit<AddnoteState> {
  AddnoteCubit() : super(AddnoteInitial());

  Color color = Colors.red;

  addNotes(NotesModal note) async {
    note.color = color.value;
    emit(AddnoteLoading());
    try {
      var notesbox = Hive.box<NotesModal>(kNotesBox);

      await notesbox.add(note);
      emit(AddnoteSuccess());
    } catch (e) {
      emit(AddnoteFailure(e.toString()));
    }
  }
}
