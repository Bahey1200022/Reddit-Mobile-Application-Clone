import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PostCategory extends StatelessWidget {
  String? category;

  PostCategory({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    Color getColor() {
      switch (category) {
        case 'general':
          return Colors.blue;
        case 'saved':
          return Colors.green;
        case 'history':
          return Colors.purple;
        default:
          return Colors.indigo;
      }
    }

    if (category == null) {
      return const SizedBox.shrink();
    }

    return ElevatedButton(
      onPressed: () {
        // Add your button click logic here
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(getColor()),
      ),
      child: Text(
        category!,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
