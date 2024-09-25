import 'package:crafty_bay/presentation/ui/utilis/app_colors.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker(
      {super.key, required this.size, required this.onSizeSelected});

  final List<String> size;
  final Function(String) onSizeSelected;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  late String _selectedSize = widget.size.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Wrap(
            spacing: 10,
            children: widget.size.map((item) {
              return GestureDetector(
                  onTap: () {
                    _selectedSize = item;
                    widget.onSizeSelected(item);
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color:
                          _selectedSize == item ? AppColors.themeColor : null,
                    ),
                    child: Text(
                      item,
                      style: TextStyle(
                        color: _selectedSize == item ? Colors.white : null,
                      ),
                    ),
                  ),
              );
            }).toList()),
      ],
    );
  }
}
