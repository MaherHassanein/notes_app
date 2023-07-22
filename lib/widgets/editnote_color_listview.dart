import 'package:flutter/material.dart';

import 'package:notes_app/costant/costant.dart';
import '../modal/notes_modal.dart';
import 'color_list_view.dart';

class EditNoteColorListView extends StatefulWidget {
  const EditNoteColorListView({required this.note});
  final NotesModal note;
  @override
  State<EditNoteColorListView> createState() => _EditNoteColorListViewState();
}

class _EditNoteColorListViewState extends State<EditNoteColorListView> {
  late int currentstate;

  @override
  void initState() {
    currentstate = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kColors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: GestureDetector(
                onTap: () {
                  currentstate = index;
                  widget.note.color = kColors[index].value;
                  setState(() {});
                },
                child: ColorItem(
                  color: kColors[index],
                  isactive: currentstate == index,
                ),
              ),
            );
          }),
    );
  }
}
