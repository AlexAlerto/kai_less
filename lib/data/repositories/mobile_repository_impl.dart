import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kai_less/domain/entitys/core/response_model.dart';
import 'package:kai_less/domain/entitys/lesson/lesson_model.dart';
import 'package:kai_less/domain/repositories/mobile_repository.dart';
import 'package:kai_less/domain/repositories/shared_pref_repository.dart';

const String mainUrl = "https://mobile.kai.ru";
const String lessonsByGroup = "/api/schedule";

class MobileRepositoryImpl extends MobileRepository {
  final Dio _dio = Dio();
  final SharedPrefRepository sharedPrefRepository;

  MobileRepositoryImpl(this.sharedPrefRepository) : super(sharedPrefRepository);

  @override
  Future<ResponseModel<List<LessonModel>>> getLessons(String groupNum) async {
    try {
      final response = await _dio.get(
        mainUrl + lessonsByGroup,
        queryParameters: {'group': groupNum},
      );

      if (response.data != null &&
          response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300 &&
          response.data != null) {
        final data = [];

        final validateResponse = response.data;
        for (var i = 1; i <= 6; i++) {
          if (validateResponse['$i'] != null) {
            data.addAll(validateResponse['$i'] as List);
          }
        }

        await sharedPrefRepository.setString(
          kLessons,
          jsonEncode(data),
        );
        return ResponseModel.success(
          data.map((e) => LessonModel.fromJsonByGroupNum(e)).toList(),
        );
      } else {
        print("Не удалось загрузить расписание");
        return ResponseModel.error('"Не удалось загрузить расписание');
      }
    } on DioException catch (error, stacktrace) {
      var message = error.response?.data["message"];

      if (message != null && message == 'Group not found') {
        return ResponseModel.error("Группа не найдена");
      }
      print("Ошибка подключения к серверу\n $stacktrace");
      return ResponseModel.error('Ошибка подключения к серверу');
    }
  }

}
