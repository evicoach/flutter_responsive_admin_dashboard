import 'package:admin/screens/authentication/data/datasources/auth_local_datasource.dart';
import 'package:admin/screens/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:admin/screens/authentication/data/repositories/auth_repository_impl.dart';
import 'package:admin/screens/authentication/domain/repositories/auth_repository.dart';
import 'package:admin/screens/authentication/domain/usecases/fetch_user_info.dart';
import 'package:admin/screens/authentication/domain/usecases/login.dart';
import 'package:admin/screens/authentication/presentation/bloc/auth_bloc.dart';
import 'package:admin/screens/authentication/presentation/bloc/user_bloc.dart';
import 'package:admin/screens/dashboard/domain/usecases/fetch_coupons.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  serviceLocator.registerFactory(() => AuthBloc(
        login: serviceLocator(),
        fetchUserInfo: serviceLocator(),
      ));

  serviceLocator.registerFactory(() => UserBloc());
  serviceLocator.registerLazySingleton<FetchUserInfo>(
      () => FetchUserInfo(repository: serviceLocator()));

  serviceLocator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        remoteDataSource: serviceLocator(),
        localDataSource: serviceLocator(),
      ));

  serviceLocator.registerLazySingleton<FetchCoupons>(
      () => FetchCoupons(repository: serviceLocator()));

  serviceLocator
      .registerLazySingleton<Login>(() => Login(repository: serviceLocator()));

  serviceLocator.registerLazySingleton<AuthLocalDatasource>(
      () => AuthLocalDatasourceImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(serviceLocator()));
}
