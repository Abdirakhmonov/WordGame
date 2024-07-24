import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/word_game_controller.dart';
import '../../models/question.dart';

class WordGame extends StatelessWidget {
  const WordGame({super.key});

  @override
  Widget build(BuildContext context) {
    final WordGameController controller = Get.put(WordGameController());

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/img.png",
              fit: BoxFit.cover,
            ),
          ),

          //? Question section
          Obx(() {
            final WordGameModel listOfQuestion =
                listQuestions[controller.indexQues.value];
            return Container(
              margin: const EdgeInsets.only(bottom: 300),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                listOfQuestion.question,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }),

          Obx(() {
            final WordGameModel listOfQuestion =
                listQuestions[controller.indexQues.value];
            return Align(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Wrap(
                      children: List.generate(
                        listOfQuestion.answer.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: 30,
                          child: TextField(
                            onTap: null,
                            readOnly: true,
                            controller: controller.controllers[index],
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 12.0,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.characters,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }),

          //? Buttons section
          Align(
            child: Container(
              margin: const EdgeInsets.only(top: 600),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Column(
                children: [
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1,
                      crossAxisCount: 8,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                    itemCount: controller.buttons.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return LayoutBuilder(
                        builder: (context, constraints) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                minimumSize: Size(
                                  constraints.biggest.width,
                                  constraints.biggest.height,
                                ),
                              ),
                              child: Text(
                                controller.buttons[index].toLowerCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                controller
                                    .addCharacter(controller.buttons[index].toLowerCase());
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
