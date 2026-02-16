import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'GOOGLE_MAPS_API_KEY')
  static const String googleMapsApiKey = _Env.googleMapsApiKey;

  @EnviedField(varName: 'GOOGLE_MAPS_BASE_URL')
  static const String googleMapsBaseUrl = _Env.googleMapsBaseUrl;

  @EnviedField(varName: 'TRIP_API_BASE_URL')
  static const String tripApiBaseUrl = _Env.tripApiBaseUrl;

  @EnviedField(varName: 'APP_DATABASE_NAME')
  static const String appDatabaseName = _Env.appDatabaseName;
}
