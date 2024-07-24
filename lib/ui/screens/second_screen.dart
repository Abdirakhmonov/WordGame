import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controller/card_controller.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final CardController cardController = Get.put(CardController());
  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.defaultDialog(
                    title: "Card",
                    content: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              label: const Text("Name"),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: cardNumberController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              label: const Text("Card Number"),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: expiryDateController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              label: const Text("Expiry Date"),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    onConfirm: () {
                      cardController.addCard(nameController.text,
                          cardNumberController.text, expiryDateController.text);
                      nameController.clear();
                      cardNumberController.clear();
                      expiryDateController.clear();
                      Get.back();
                    },
                    onCancel: () {
                      Get.back();
                    },
                    textConfirm: "Add",
                    textCancel: "Cancel");
              },
              icon: const Icon(Icons.add))
        ],
        centerTitle: true,
        title: const Text(
          "Cards",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: cardController.cards.length,
          itemBuilder: (context, index) {
            final card = cardController.cards[index];
            return Card(
              color:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      card.name,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      card.cardNumber,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      card.expiryCard,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
