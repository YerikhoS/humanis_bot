import '../api_caller/api_caller.dart';
import '../api_caller/api_service.dart';
import '../model/auth_model.dart';

class AbsenRepository {
  AbsenRepository();
  final ApiCaller api = ApiCaller();
  Future<AuthModel?> clockIn({
    required String idKaryawan,
    required String lat,
    required String long,
    required String imei,
    required String kodeDevice,
    required String hour,
    required String minute,
    required String token,
    required String foto,
    required String day,
  }) async {
    AuthModel? response;
    await api
        .post(
            ApiService.clockInOut,
            {
              'foto': foto,
              'id_client': '230830120221',
              'id_karyawan': idKaryawan,
              'latitude': lat,
              'longitude': long,
              'imei': imei,
              'sumber': '2',
              'jam_checkclock_zona':
                  '${DateTime.now().year.toString()}-${DateTime.now().month.toString()}-$day $hour:$minute:12',
              'kode_device': kodeDevice,
              'zona_waktu': 'WIB',
              'time':
                  '${DateTime.now().year.toString()}-${DateTime.now().month.toString()}-$day $hour:$minute:12',
              'tgl_checklock[year]': DateTime.now().year.toString(),
              'tgl_checklock[month]': DateTime.now().month.toString(),
              'tgl_checklock[day]': '$day',
              'jam':
                  '${DateTime.now().year.toString()}-${DateTime.now().month.toString()}-$day $hour:$minute:12',
              'tipe_presensi': '1',
              'jam_checklock[hour]': hour,
              'jam_checklock[minute]': minute,
              'jam_checklock[second]': '12',
              'waktu': '$hour:$minute:12',
              'id_perusahaan': 'hm_230830120221_64eecd7c90faa',
              'jadwal_masuk': '09:00',
              'jadwal_pulang': '18:00',
            },
            token: token)
        .then((value) {
      print('login CALLBACK VALUE $value');
      response = AuthModel.fromJson(value);
    });
    if (response != null) {
      return response!;
    } else {
      return null;
    }
  }

  Future<AuthModel?> clockOut({
    required String idKaryawan,
    required String lat,
    required String long,
    required String imei,
    required String kodeDevice,
    required String hour,
    required String minute,
    required String token,
    required String foto,
    required String day,
  }) async {
    AuthModel? response;
    await api
        .post(
            ApiService.clockInOut,
            {
              'foto': foto,
              'id_client': '230830120221',
              'id_karyawan': idKaryawan,
              'latitude': lat,
              'longitude': long,
              'imei': imei,
              'sumber': '2',
              'jam_checkclock_zona':
                  '${DateTime.now().year.toString()}-${DateTime.now().month.toString()}-${DateTime.now().month.toString()} $hour:$minute:12',
              'kode_device': kodeDevice,
              'zona_waktu': 'WIB',
              'time':
                  '${DateTime.now().year.toString()}-${DateTime.now().month.toString()}-${DateTime.now().month.toString()} $hour:$minute:12',
              'tgl_checklock[year]': DateTime.now().year.toString(),
              'tgl_checklock[month]': DateTime.now().month.toString(),
              'tgl_checklock[day]': '$day',
              'jam':
                  '${DateTime.now().year.toString()}-${DateTime.now().month.toString()}-${DateTime.now().month.toString()} $hour:$minute:12',
              'tipe_presensi': '2',
              'jam_checklock[hour]': hour,
              'jam_checklock[minute]': minute,
              'jam_checklock[second]': '12',
              'waktu': '$hour:$minute:12',
              'id_perusahaan': 'hm_230830120221_64eecd7c90faa',
              'jadwal_masuk': '09:00',
              'jadwal_pulang': '18:00',
            },
            token: token)
        .then((value) {
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
