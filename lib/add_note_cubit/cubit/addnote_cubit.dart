import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/costant/costant.dart';

import '../../modal/notes_modal.dart';

part 'addnote_state.dart';

class AddnoteCubit extends Cubit<AddnoteState> {
  AddnoteCubit() : super(AddnoteInitial());

  addNotes(NotesModal note) async {
    emit(AddnoteLoading());
    try {
      var notesbox = Hive.box<NotesModal>(kNotesBox);
      emit(AddnoteSuccess());
      await notesbox.add(note);
    } catch (e) {
      emit(AddnoteFailure(e.toString()));
    }
  }
}
