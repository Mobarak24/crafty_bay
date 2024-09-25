import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker(
      {super.key, required this.color, required this.onColorSelected});

  final List<Color> color;
  final Function(Color) onColorSelected;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  late Color _selectedColor = widget.color.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Wrap(
            spacing: 10,
            children: widget.color.map((item) {
              return GestureDetector(
                onTap: () {
                  _selectedColor = item;
                  widget.onColorSelected(item);
                  setState(() {});
                },
                child: CircleAvatar(
                  backgroundColor: item,
                  child: _selectedColor == item
                      ? const Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : null,
                ),
              );
            }).toList()),
      ],
    );
  }
}
