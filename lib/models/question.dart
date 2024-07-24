import 'package:lesson_83/models/word_find.dart';

class WordGameModel {
  final String question;
  final String answer;
  late List<String> arrayBtns;
  late List<WordFindPuzzle> puzzles;
  bool isDone = false;
  bool isFull = false;

  WordGameModel({
    required this.question,
    required this.answer,
  });
}

List<WordGameModel> listQuestions = [
  WordGameModel(
    question: "Qirg'izstonning poytaxti?",
    answer: "bishkek",
  ),

  WordGameModel(
    question: "Fransiyaning poytaxti?",
    answer: "parij",
  ),
  WordGameModel(
    question: "Avstiryaning poytaxti?",
    answer: "vena",
  ),
  WordGameModel(
    question: "Ispaniyaning poytaxti?",
    answer: "madrid",
  ),
  WordGameModel(
    question: "O'zbekistonning poytaxti?",
    answer: "toshkent",
  ),
];
