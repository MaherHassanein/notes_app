import 'package:flutter/material.dart';
import 'package:notes_app/widgets/addnote_buttomsheet.dart';
import 'package:notes_app/widgets/notes_views_body.dart';

class NotesViews extends StatelessWidget {
  const NotesViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      AddNoteButtom(),
                    ],
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
      body: NotesViewsBody(),
    );
  }
}
