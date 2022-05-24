import 'package:flutter/material.dart';

class AddRecipeChips extends StatelessWidget {
  final String object;
  final VoidCallback add, remove;
  const AddRecipeChips({
    Key? key,
    required this.add,
    required this.remove,
    required this.object,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ActionChip(
          label: Text('Add $object'),
          onPressed: add,
        ),
        ActionChip(
          label: Text('Remove $object'),
          onPressed: remove,
        ),
      ],
    );
  }
}
