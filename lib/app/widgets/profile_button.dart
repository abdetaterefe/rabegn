import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class ProfileButton extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  const ProfileButton({
    Key? key,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(5),
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ).asGlass(
        tintColor: Colors.orange,
        clipBorderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
