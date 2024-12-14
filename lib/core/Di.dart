import 'package:food_saver/core/Sh.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  ///Dio
  // sl.registerLazySingleton<Dio>(() => Dio());

  // sl.registerLazySingleton<BaseClient>(
  //   () => BaseClient(sl<Dio>()),
  // );

  /// SharedPref
  sl.registerLazySingleton<MySharedPrefInterface>(
    () => MySharedPref(),
  );

  /// Router

  // /// data source
}
