import 'package:kai_less/domain/entitys/core/response_model.dart';
import 'package:kai_less/domain/entitys/lesson/lesson_model.dart';
import 'package:kai_less/domain/repositories/shared_pref_repository.dart';

abstract class MobileRepository {
  final SharedPrefRepository sharedPrefRepository;

  MobileRepository(this.sharedPrefRepository);

  Future<ResponseModel<List<LessonModel>>> getLessons(String groupNum);

}
