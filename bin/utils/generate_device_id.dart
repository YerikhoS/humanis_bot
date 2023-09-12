import 'dart:math';

class Utils {
  String generateRandomStringDeviceId(int length) {
    const charset = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random.secure();
    final values = List<int>.generate(length, (i) => charset.codeUnitAt(random.nextInt(charset.length)));
    return String.fromCharCodes(values);
  }

  String generateRandomStringDeviceCode() {
    const charset = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random.secure();

    final randomChars = List<int>.generate(2, (i) => charset.codeUnitAt(random.nextInt(charset.length)));
    final randomDigits = List<int>.generate(3, (i) => charset.codeUnitAt(random.nextInt(charset.length)));
    final randomCharsAfterDigits = List<int>.generate(1, (i) => charset.codeUnitAt(random.nextInt(charset.length)));

    final chars = String.fromCharCodes(randomChars);
    final digits = String.fromCharCodes(randomDigits);
    final charsAfterDigits = String.fromCharCodes(randomCharsAfterDigits);
    print('DEVICE CODE E----================>>>$chars$digits$charsAfterDigits ');

    return '$chars$digits$charsAfterDigits';
  }
}
