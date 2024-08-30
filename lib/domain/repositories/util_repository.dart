import 'package:kai_less/domain/entitys/core/response_model.dart';
import 'package:kai_less/domain/entitys/service/util/weather_model.dart';

abstract class UtilRepository{
  Future<ResponseModel<WeatherModel>> getWeather();
}