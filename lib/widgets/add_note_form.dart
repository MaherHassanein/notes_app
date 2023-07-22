import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/add_note_cubit/cubit/addnote_cubit.dart';

import '../modal/notes_modal.dart';
import 'custom_textbuttom.dart';
import 'custom_textfield.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          CustomTextField(
            onsaved: (data) {
              title = data;
            },
            hint: 'Title',
          ),
          SizedBox(
            height: 15,
          ),
          CustomTextField(
            onsaved: (data) {
              subtitle = data;
            },
            hint: 'Content',
            maxlines: 6,
          ),
          SizedBox(
            height: 30,
          ),
          BlocBuilder<AddnoteCubit, AddnoteState>(
            builder: (context, state) {
              return CustomTextButtom(
                islosding: state is AddnoteLoading ? true : false,
                ontap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var currentdate = DateTime.now();
                    var currentdateformate = DateFormat().format(currentdate);
                    var notesmodal = NotesModal(
                        title: title!,
                        subtitle: subtitle!,
                        date: currentdateformate,
                        color: Colors.blue.value);
                    BlocProvider.of<AddnoteCubit>(context).addNotes(notesmodal);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
