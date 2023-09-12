import '../api_caller/api_caller.dart';
import '../api_caller/api_service.dart';
import '../model/auth_model.dart';

class AuthRepository {
  AuthRepository();
  final ApiCaller api = ApiCaller();
  Future<AuthModel?> login({
    required String email,
    required String device,
    required String deviceId,
    required String deviceCode,
  }) async {
    AuthModel? response;
    await api.post(ApiService.login, {
      'email': email,
      'accessToken': 'REDACTED',
      'registrationToken':
          'cJ2bq1QQR8-sZ5qYsQqH0U:APA91bGT-dt3dgo12L9e6CPFD98TGNwQUBT811LDGXyhTYFzlRtPooC3rK4-WzV8xH29vZ6kiCbEMmA2msOdl4HeHB7gpIgPD65SIOM9WLFyCs8dsnEiP8UG-l5xItA8vbjq-NUAUVWb',
      'device': device,
      'kode_device': deviceCode,
      'device_id': deviceId,
      'sumber': '2',
      'status_backdoor': 'true',
    }, token: '').then((value) {
      print('login CALLBACK VALUE $value');
      response = AuthModel.fromJson(value);
    });
    if (response != null) {
      return response!;
    } else {
      return null;
    }
  }
}
