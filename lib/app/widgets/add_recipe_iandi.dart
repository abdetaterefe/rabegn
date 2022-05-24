import 'package:flutter/material.dart';

class AddRecipeIandI extends StatelessWidget {
  final String object;
  final double height;
  final int count;
  final List<TextEditingController> _controllers;

  final String? Function(String?)? validate;
  const AddRecipeIandI({
    Key? key,
    required this.height,
    required this.count,
    required List<TextEditingController> controllers,
    required this.object,
    this.validate,
  })  : _controllers = controllers,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: count,
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemBuilder: (context, index) {
          _controllers.add(TextEditingController());
          return TextFormField(
            controller: _controllers[index],
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: '$object ${index + 1}',
            ),
            validator: validate,
          );
        },
      ),
    );
  }
}
