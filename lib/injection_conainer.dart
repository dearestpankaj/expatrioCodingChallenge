import 'package:coding_challenge/feature/login/data/data_source/user_auth_local_data_source.dart';
import 'package:coding_challenge/feature/login/data/repository/user_auth_repository_impl.dart';
import 'package:coding_challenge/feature/login/domain/repository/user_auth_repository.dart';
import 'package:coding_challenge/feature/tax_detail/data/data_source/tax_detail_remote_data_source.dart';
import 'package:coding_challenge/feature/tax_detail/data/repository/tax_detail_repository_impl.dart';
import 'package:coding_challenge/feature/tax_detail/domain/repository/tax_detail_repository.dart';
import 'package:coding_challenge/feature/tax_detail/domain/usecase/tax_detail_usecase.dart';
import 'package:coding_challenge/feature/login/data/data_source/login_remote_data_source.dart';
import 'package:coding_challenge/feature/login/domain/usecases/login_usecase.dart';
import 'package:coding_challenge/feature/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'feature/login/data/repository/login_repository_impl.dart';
import 'feature/login/domain/repository/login_repository.dart';
import 'feature/tax_detail/presentation/bloc/tax_detail_bloc.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  locator.registerFactory(() => TaxDetailBloc(locator()));
  locator.registerLazySingleton<TaxDetailUseCase>(() => TaxDetailUseCase(taxDetailRepository: locator(), userAuthRepository: locator()));
  locator.registerLazySingleton<TaxDetailRepository>(() => TaxDetailRepositoryImpl(taxDetailRemoteDataSource: locator()));
  locator.registerLazySingleton<TaxDetailRemoteDataSource>(() => TaxDetailRemoteDataSourceImpl(client: locator()));

  locator.registerFactory<LoginBloc>(() => LoginBloc(locator()));
  locator.registerLazySingleton<LoginUseCase>(() => LoginUseCase(loginRepository: locator(), userAuthRepository: locator()));
  locator.registerLazySingleton<UserAuthRepository>(() => UserAuthRepositoryImp(userAuthLocalDataSource: locator()));
  locator.registerLazySingleton<UserAuthLocalDataSource>(() => UserAuthLocalDataSourceImpl(storage: locator()));
  locator.registerLazySingleton(() => FlutterSecureStorage());

  locator.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImp(loginRemoteDataSource: locator()));
  locator.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(client: locator()));

  locator.registerLazySingleton(() => http.Client());
}
