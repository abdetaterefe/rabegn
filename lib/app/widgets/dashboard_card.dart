import 'package:flutter/material.dart';

class DashBoardCard extends StatelessWidget {
  final String category;
  final String info;
  const DashBoardCard({
    Key? key,
    required this.category,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            category,
            style: const TextStyle(fontSize: 25),
          ),
          const Spacer(),
          Text(
            info,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
