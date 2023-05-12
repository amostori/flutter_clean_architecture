import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUsecase {
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    AdviceEntity adviceEntity =
        const AdviceEntity(advice: 'fake advice', id: 1);
    // return right(adviceEntity);
    return left(CacheFailure());
  }
}
