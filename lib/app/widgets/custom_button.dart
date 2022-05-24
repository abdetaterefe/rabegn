import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String bName;
  final VoidCallback onTap;
  const CustomButton({
    Key? key,
    required this.bName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          bName,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
