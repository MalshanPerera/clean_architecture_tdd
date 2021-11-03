import 'dart:convert';

import 'package:clean_architecture_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const NumberTriviaModel tNumberTriviaModel = NumberTriviaModel(text: "Test Text", number: 1);

  test(
    "should be a subclass of NumberTrivia entity",
    () async {
      // Asserts
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );

  group(
    "fromJson",
    () {
      test(
        "should return a valid model when the JSON number is an integer",
        () async {
          // Arrange
          final Map<String, dynamic> jsonMap = json.decode(fixtureReader('trivia.json'));
          // Act
          final result = NumberTriviaModel.fromJson(jsonMap);
          // Asserts
          expect(result, tNumberTriviaModel);
        },
      );

      test(
        "should return a valid model when the JSON number is regarded as a double",
        () async {
          // Arrange
          final Map<String, dynamic> jsonMap = json.decode(fixtureReader('trivia_double.json'));
          // Act
          final result = NumberTriviaModel.fromJson(jsonMap);
          // Asserts
          expect(result, tNumberTriviaModel);
        },
      );
    },
  );
}
