import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class AddRecipeFAB extends StatelessWidget {
  final VoidCallback onTap;
  const AddRecipeFAB({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(
              Icons.add,
            ),
            Text(
              'add recipe',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        ),
      ).asGlass(
        tintColor: Colors.orange,
        clipBorderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
