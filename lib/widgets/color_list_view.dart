import 'package:flutter/material.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.black,
    Colors.brown,
    Colors.yellow,
    Colors.blue
  ];
  int currentstate = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: GestureDetector(
                onTap: () {
                  currentstate = index;
                  setState(() {});
                },
                child: ColorItem(
                  color: colors[index],
                  isactive: currentstate == index,
                ),
              ),
            );
          }),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({required this.color, required this.isactive});
  final bool isactive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isactive
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 32,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 38,
            backgroundColor: color,
          );
  }
}
