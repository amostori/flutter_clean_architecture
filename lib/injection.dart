import 'package:advicer/data/datasources/advice_remote_datasource.dart';
import 'package:advicer/data/repositories/advice_repo_imp.dart';
import 'package:advicer/domain/repositories/advice_repo.dart';
import 'package:advicer/domain/usecases/advice_usecases.dart';
import 'package:advicer/presentation/screens/home/cubit/advicer_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I;

Future<void> init() async {
  // application layer
  sl.registerFactory(() => AdvicerCubit(adviceUsecase: sl()));
  // domain layer
  sl.registerFactory(() => AdviceUsecase(adviceRepo: sl()));
  // data layer
  sl.registerFactory<AdviceRepo>(
      () => AdviceRepoImp(adviceRemoteDatasource: sl()));
  sl.registerFactory<AdviceRemoteDatasource>(
      () => AdviceRemoteDatasourceImp(client: sl()));
  // externs
  sl.registerFactory(() => http.Client());
}
