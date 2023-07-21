import 'package:flutter/material.dart';
import 'package:notes_app/modal/notes_modal.dart';
import 'package:notes_app/widgets/custom_textbuttom.dart';
import 'package:notes_app/widgets/custom_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/add_note_cubit/cubit/addnote_cubit.dart';

class AddNoteButtom extends StatefulWidget {
  const AddNoteButtom({super.key});

  @override
  State<AddNoteButtom> createState() => _AddNoteButtomState();
}

class _AddNoteButtomState extends State<AddNoteButtom> {
  GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddnoteCubit(),
      child: Form(
        key: formkey,
        autovalidateMode: autovalidateMode,
        child: BlocConsumer<AddnoteCubit, AddnoteState>(
          listener: (context, state) {
            if (state is AddnoteSuccess) {
              Navigator.pop(context);
            }

            if (state is AddnoteFailure) {
              print('failied  $state.errormassege');
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddnoteLoading ? true : false,
              child: SingleChildScrollView(
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
                      height: 90,
                    ),
                    BlocBuilder<AddnoteCubit, AddnoteState>(
                      builder: (context, state) {
                        return CustomTextButtom(
                          islosding: state is AddnoteLoading ? true : false,
                          ontap: () {
                            if (formkey.currentState!.validate()) {
                              formkey.currentState!.save();
                              var notesmodal = NotesModal(
                                  title: title!,
                                  subtitle: subtitle!,
                                  date: DateTime.now().toString(),
                                  color: Colors.blue.value);
                              BlocProvider.of<AddnoteCubit>(context)
                                  .addNotes(notesmodal);
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
              ),
            );
          },
        ),
      ),
    );
  }
}
