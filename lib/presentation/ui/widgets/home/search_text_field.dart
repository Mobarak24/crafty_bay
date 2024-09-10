import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key, required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none
        ),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide.none
        ),
      ),
    );
  }
}