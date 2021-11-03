import 'package:clean_architecture_tdd/core/use_case/use_case.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/use_cases/get_random_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRandomNumberTriviaRepository extends Mock implements NumberTriviaRepository {}

void main() {

  late GetRandomNumberTrivia useCase;
  late MockRandomNumberTriviaRepository mockRandomNumberTriviaRepository;

  setUp(() {
    mockRandomNumberTriviaRepository = MockRandomNumberTriviaRepository();
    useCase = GetRandomNumberTrivia(mockRandomNumberTriviaRepository);
  });

  const NumberTrivia tNumberTrivia = NumberTrivia(text: "test", number: 1);

  test(
      "should get random trivia from the repository",
          () async {
        // Arrange
        when(mockRandomNumberTriviaRepository.getRandomTrivia()).thenAnswer((realInvocation) async => const Right(tNumberTrivia));
        // Act
        final result = await useCase(NoParams());
        // Assert
        expect(result, const Right(tNumberTrivia));
        verify(mockRandomNumberTriviaRepository.getRandomTrivia());
        verifyNoMoreInteractions(mockRandomNumberTriviaRepository);
      }
  );
}