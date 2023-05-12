import 'package:advicer/data/repositories/advice_repo_imp.dart';
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

import '../repositories/advice_repo.dart';

class AdviceUsecase {
  final AdviceRepo adviceRepo;

  AdviceUsecase({required this.adviceRepo});

  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    return adviceRepo.getAdviceFromDatasource();
  }
}
