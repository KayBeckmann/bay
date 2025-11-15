import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart' as crypto;

/// Centralized password hashing helper to keep credential handling consistent.
class PasswordService {
  PasswordService._();

  static final PasswordService instance = PasswordService._();

  final Random _random = Random.secure();

  String generateSalt([int length = 32]) {
    final bytes = List<int>.generate(length, (_) => _random.nextInt(256));
    return base64Url.encode(bytes);
  }

  String hashPassword(String password, String salt) {
    final payload = utf8.encode('$salt::$password');
    final digest = crypto.sha512.convert(payload);
    return base64Url.encode(digest.bytes);
  }

  bool verify(String password, String salt, String existingHash) {
    return hashPassword(password, salt) == existingHash;
  }
}
