import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/card.dart';

class CardController extends GetxController {
  var cards = <Card>[].obs;

  void addCard(String name, String cardNumber, String expiryDate) {
    final card = Card(
      id: DateTime.now().toString(),
      name: name,
      cardNumber: cardNumber,
      expiryCard: expiryDate,
    );
    cards.add(card);
  }
}
