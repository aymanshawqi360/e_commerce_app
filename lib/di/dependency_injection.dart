import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/networking/dio_factory.dart';
import 'package:e_commerce_app/features/auth/data/api/auth_api_service.dart';
import 'package:e_commerce_app/features/auth/data/repo_implementation/auth_repo_implementation.dart';
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:e_commerce_app/features/auth/domain/use_case/auth_login_use_cases.dart';
import 'package:e_commerce_app/features/auth/domain/use_case/auth_signup_use_cases.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/signup/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  //!NetWorking
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<DioFactory>(() => DioFactory(dio: sl()));

  //!Data/
  //Api
  sl.registerLazySingleton<AuthApiService>(
    () => AuthApiService(dioFactory: sl()),
  );

  //RepoImplementation

  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImplementation(authApiService: sl()),
  );

  //!UseCases
  sl.registerLazySingleton<AuthSignupUseCases>(
    () => AuthSignupUseCases(authRepo: sl()),
  );
  sl.registerLazySingleton<AuthLoginUseCases>(
    () => AuthLoginUseCases(authRepo: sl()),
  );

  //!cubit
  sl.registerFactory(() => SignupCubit(authSignupUseCases: sl()));
  sl.registerFactory(() => LoginCubit(authLoginUseCases: sl()));
}
