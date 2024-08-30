import 'package:get_it/get_it.dart';
import 'package:kai_less/data/repositories/repository_locator_service.dart';
import 'package:kai_less/presentation/screens/generals_screen/generals_locator_service.dart';
import 'package:kai_less/presentation/screens/lessons_screen/lessons_locator_service.dart';

GetIt locator = GetIt.instance;

Future<void> initLocatorService() async {
  await initRepositoryLocatorService(locator);
  await initGeneralsLocatorService(locator);

  await initLessonsLocatorService(locator);
}
