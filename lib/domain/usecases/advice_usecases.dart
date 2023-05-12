import 'package:advicer/domain/entities/advice_entity.dart';

class AdviceUsecase {
  Future<AdviceEntity> getAdvice() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    AdviceEntity adviceEntity =
        const AdviceEntity(advice: 'fake advice', id: 1);
    return adviceEntity;
  }
}
