part of 'addnote_cubit.dart';

@immutable
abstract class AddnoteState {}

class AddnoteInitial extends AddnoteState {}

class AddnoteLoading extends AddnoteState {}

class AddnoteSuccess extends AddnoteState {}

class AddnoteFailure extends AddnoteState {
  final String errormassege;

  AddnoteFailure(this.errormassege);
}
