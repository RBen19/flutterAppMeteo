import 'package:app_meteo/models/weather.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

class Api {
  static const String currentdata = '/current.json';
}

@RestApi(baseUrl: 'http://api.weatherapi.com/v1')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @GET("/current.json")
  Future<Weather> getWeatherData(
      @Query('key') String apiKey, @Query('q') String location);
}
