import 'dart:convert';
import 'dart:developer';
import 'dart:io' as io;
import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'model/auth_model.dart';
import 'repository/absen_repository.dart';
import 'repository/auth_repository.dart';
import 'package:http/http.dart' as http;
import 'utils/generate_device_id.dart';

Future<void> main() async {
  final username = (await Telegram('6190040476:AAEmsYAey0SkFKeN47G-goGL1edPqgwqf4s').getMe()).username;
  print('ISI USER NAME $username ');
  print('ISI DATE BRO ${DateTime.now().year.toString()}-${DateTime.now().month.toString()}-${DateTime.now().day.toString()}');
  var teledart = TeleDart('6190040476:AAEmsYAey0SkFKeN47G-goGL1edPqgwqf4s', Event(username!));
  final AuthRepository _repository = AuthRepository();
  final AbsenRepository _absenRepository = AbsenRepository();

  final Utils _utils = Utils();

  teledart.start();
  String deviceName = '';
  AuthModel? loginData;
  String latitude = '';
  String longitude = '';
  String hour = '';
  String minute = '';
  String photoUser = '';

  bool waitingForName = false;
  bool waitingForDeviceName = false;
  bool waitingForLat = false;
  bool waitingForLong = false;
  bool waitingForPhoto = false;
  bool waitingForHour = false;
  bool waitingForMinute = false;
  bool waitingForIN = false;
  bool waitingForOut = false;

  teledart.onMessage(entityType: 'bot_command', keyword: 'start').listen(
        (message) => message.replyPhoto(
          'https://www.qoin.id/img/qoin_logo.png',
          caption:
              'Halo Selamat datang di humanis bot, bot ini sudah memiliki izin dari HR Qoin yaaaa, berikut list command yang bisa kamu gunakan dan harus kamu ikuti step by step.\n\n/deviceName untuk memasukan merk hp kamu contoh (xiaomi).\n\n/login untuk melakukan login ke akun humanis kamu.\n\n/setLat untuk mengatur latitude yang kamu inginkan.\n\n/setLong untuk mengatur longitute yang kamu inginkan.\n\n/setPhoto untuk set photo yang kamu ingin pakai untuk clock in.\n\n/setHour untuk menentukan jam clock in atau clock out kamu.\n\n/setMinute untuk menentukan menit clock in atau clock out kamu. \n\nLalu pilih ingin clock in atau clock out dengan menggunakan comman /clockIn atau /clockOut.\n\n Pastikan kamu mengikuti urutan diatas ya!!!!',
        ),
      );

  teledart.onMessage(entityType: 'bot_command', keyword: 'deviceName').listen((message) {
    waitingForDeviceName = true;
    message.reply('Ketikan merk HP kamu yaaaa');
  });

  teledart.onMessage().listen((message) {
    if (waitingForDeviceName) {
      if (message.text != null) {
        deviceName = message.text!;
        teledart.sendMessage(message.chat.id, 'Device name tersimpan, kuy login sekarang dengan ketikan /login');
        waitingForDeviceName = false;
      }
    }
  });

  teledart
      .onMessage(entityType: 'bot_command', keyword: 'login')
      .listen((message) {
          waitingForName = true;
          message.reply('Ketikan email kamu seperti contoh dibawah ini\n\n karyawan@loyalto.id');
      });

  teledart.onEmail().listen((message) async {
    if (waitingForName) {
      log('call');
      final email = message.text!;
      teledart.sendMessage(message.chat.id, 'Login sedang diproses mohon tunggu...');
      final resultLogin = await _repository.login(
        email: email,
        device: '$deviceName ${_utils.generateRandomStringDeviceCode()}',
        deviceId: _utils.generateRandomStringDeviceId(16),
        deviceCode: '${deviceName.substring(0, 2)}-${_utils.generateRandomStringDeviceCode()}',
      );
      loginData = resultLogin;
      if (resultLogin != null) {
        if (resultLogin.statusCode == 200) {
          teledart.sendMessage(message.chat.id, 'Yeay anda berhasil login, yuk setting latitude kamu dengan ketik /setLat');
          waitingForLat = true;
        } else {
          teledart.sendMessage(message.chat.id, 'Login gagal, kamu gaboleh pake bot berarti');
        }
      } else {
        teledart.sendMessage(message.chat.id, 'Login gagal, kamu gaboleh pake bot berarti');
      }

      waitingForName = false;
    } 
  });

  teledart.onMessage(entityType: 'bot_command', keyword: 'setLat').listen((message) async {
    waitingForLat = true;
    message.reply('Ketikan Latitude yang kamu inginkan!');
  });

  teledart.onMessage().listen((message) {
    if (waitingForLat) {
      if (message.text != null) {
        latitude = message.text!;
        teledart.sendMessage(message.chat.id, 'Latitude tersimpan, yuk masukan longitude kamu dengan ketik /setLong');
        waitingForLat = false;
      }
    }
  });

  teledart.onMessage(entityType: 'bot_command', keyword: 'setLong').listen((message) {
    waitingForLong = true;
    message.reply('Ketikan Longitude yang kamu inginkan!');
  });

  teledart.onMessage().listen(
    (message) {
      if (waitingForLong) {
        if (message.text != null) {
          longitude = message.text!;
          teledart.sendMessage(message.chat.id, 'longitude tersimpan, yuk masukan foto kamu dengan ketik /setPhoto');
          waitingForLong = false;
        }
      }
    },
  );

  teledart.onMessage(entityType: 'bot_command', keyword: 'setPhoto').listen((message) {
    waitingForPhoto = true;
    message.reply('Kirimkan foto kamu dalam bentuk photo ya!!!');
  });

  teledart.onMessage().listen((message) async {
    if (waitingForPhoto) {
      if (message.photo != null) {
        print('ISI FILE PHOTO =========>>>>> ${message.photo!.first}');
        final photoFilePath = await teledart.getFile(message.photo!.first.fileId);
        print('ISI FILE PHOTO =========>>>>> ${photoFilePath.filePath}');
        final fileUrl = 'https://api.telegram.org/file/bot6190040476:AAEmsYAey0SkFKeN47G-goGL1edPqgwqf4s/${photoFilePath.filePath}';
        final response = await http.get(Uri.parse(fileUrl));
        print('ISI RESPONSE ${response.bodyBytes}');
        final fileBytes = response.bodyBytes;

        final base64String = base64Encode(fileBytes);
        photoUser = base64String;
        teledart.sendMessage(message.chat.id, 'Foto tersimpan, ayo atur jam kamu dengan ketik /setHour');
        waitingForPhoto = false;
      }
    }
  });

  teledart.onMessage(entityType: 'bot_command', keyword: 'setHour').listen((message) {
    waitingForHour = true;
    message.reply('ketilan jam yang kamu mau ya, contoh (09)');
  });

  teledart.onMessage().listen(
    (message) {
      if (waitingForHour) {
        if (message.text != null) {
          hour = message.text!;
          teledart.sendMessage(message.chat.id, 'Jam tersimpan, yuk masukan menit kamu dengan ketik /setMinute');
          waitingForHour = false;
        }
      }
    },
  );

  teledart.onMessage(entityType: 'bot_command', keyword: 'setMinute').listen((message) {
    waitingForMinute = true;
    message.reply('ketilan menit yang kamu mau ya, contoh (15)');
  });

  teledart.onMessage().listen(
    (message) {
      if (waitingForMinute) {
        if (message.text != null) {
          minute = message.text!;
          teledart.sendMessage(
              message.chat.id, 'menit tersimpan, yuk pilih mau clock in atau clock out dengan ketik /clockIn  atau /clockOut');
          waitingForMinute = false;
        }
      }
    },
  );

  teledart.onMessage(entityType: 'bot_command', keyword: 'clockIn').listen((message) async {
    message.reply('Clock in kamu sedang di proses sabar ya cok');
    await _absenRepository.clockIn(
      idKaryawan: loginData!.data!.user!.userId ?? '',
      lat: latitude,
      long: longitude,
      imei: '',
      kodeDevice: '${deviceName.substring(0, 2)}-${_utils.generateRandomStringDeviceCode()}',
      hour: hour,
      minute: minute,
      token: loginData!.data!.base64 ?? '',
      foto: photoUser,
    );
    message.reply('Clock in kamu berhasil ya');
  });

    teledart.onMessage(entityType: 'bot_command', keyword: 'clockOut').listen((message) async {
    message.reply('Clock out kamu sedang di proses sabar ya cok');
    await _absenRepository.clockOut(
      idKaryawan: loginData!.data!.user!.userId ?? '',
      lat: latitude,
      long: longitude,
      imei: '',
      kodeDevice: '${deviceName.substring(0, 2)}-${_utils.generateRandomStringDeviceCode()}',
      hour: hour,
      minute: minute,
      token: loginData!.data!.base64 ?? '',
      foto: photoUser,
    );
    message.reply('Clock out kamu berhasil ya');
  });
}
