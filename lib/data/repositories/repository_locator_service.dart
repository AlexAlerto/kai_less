import 'package:get_it/get_it.dart';
import 'package:kai_less/data/repositories/mobile_repository_impl.dart';
import 'package:kai_less/data/repositories/shared_pref_repository_impl.dart';
import 'package:kai_less/domain/repositories/mobile_repository.dart';
import 'package:kai_less/domain/repositories/shared_pref_repository.dart';
import 'package:package_info/package_info.dart';

Future<void> initRepositoryLocatorService(GetIt locator) async {
  SharedPrefRepository sharedPref = SharedPrefRepositoryImpl();
  await sharedPref.init();
  locator.registerSingleton<SharedPrefRepository>(sharedPref);
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  locator.registerSingleton<PackageInfo>(packageInfo);
  locator.registerSingleton<MobileRepository>(MobileRepositoryImpl(locator()));
}
