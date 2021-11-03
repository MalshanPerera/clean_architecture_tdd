import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/number_trivia.dart';

abstract class NumberTriviaRepository {

  Future<Either<Failure, NumberTrivia>>? getNumberTrivia(int? number);

  Future<Either<Failure, NumberTrivia>>? getRandomTrivia();
}