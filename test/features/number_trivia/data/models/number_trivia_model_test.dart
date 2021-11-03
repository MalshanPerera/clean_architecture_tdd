import 'package:clean_architecture_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  const NumberTriviaModel tNumberTriviaModel = NumberTriviaModel(text: "Test Text", number: 1);

  test(
    "description",
    () async {
      // Asserts
      expect(tNumberTriviaModel, isA<NumberTrivia>());  
    },
  );
}