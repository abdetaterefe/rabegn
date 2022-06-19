import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RecipeInstructionView extends GetView {
  @override
  Widget build(BuildContext context) {
    var inst = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Instruction',
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: inst[0].length,
                physics: const ScrollPhysics(
                  parent: null,
                ),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return Text(
                    "<> " + inst[0][index].toString(),
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
