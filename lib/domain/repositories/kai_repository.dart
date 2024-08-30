import 'package:kai_less/domain/entitys/core/response_model.dart';
import 'package:kai_less/domain/entitys/lesson/lesson_model.dart';
import 'package:kai_less/domain/repositories/shared_pref_repository.dart';

abstract class KaiRepository {
  final SharedPrefRepository sharedPrefRepository;
  final String mainUrl = "https://app.kai.ru/api";
  KaiRepository(this.sharedPrefRepository);
  Future<ResponseModel<List<LessonModel>>> getLessons(String studId);
}
