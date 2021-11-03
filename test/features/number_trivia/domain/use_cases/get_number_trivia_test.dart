
import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/use_cases/get_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository {}

void main() {

  late GetNumberTrivia useCase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  
  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    useCase = GetNumberTrivia(mockNumberTriviaRepository);
  });

  const int tNumber = 1;
  const NumberTrivia tNumberTrivia = NumberTrivia(text: "test", number: 1);

  test(
    "should get trivia for the number from the repository",
    () async {
      // Arrange
      when(mockNumberTriviaRepository.getNumberTrivia(any)).thenAnswer((realInvocation) async => const Right(tNumberTrivia));
      // Act
      final result = await useCase(tNumber);
      // Assert
      expect(result, const Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    }
  );
}