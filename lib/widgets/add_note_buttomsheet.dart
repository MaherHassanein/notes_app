import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_textbuttom.dart';
import 'package:notes_app/widgets/custom_textfield.dart';

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
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
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
            CustomTextButtom(
              ontap: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
