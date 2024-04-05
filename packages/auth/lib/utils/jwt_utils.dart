import 'package:auth/utils/jwt_constants.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

abstract class JWTUtils {
  static String generateAccessToken({required String data}) {
    final jwt = JWT({
      'data': data,
    });

    return jwt.sign(
      SecretKey(JWTConstants.accesssTokenSecretKey),
      expiresIn: const Duration(minutes: 20),
    );
  }

  static String generateRefreshToken({required String data}) {
    final jwt = JWT({
      'data': data,
    });

    return jwt.sign(
      SecretKey(JWTConstants.accesssTokenSecretKey),
      expiresIn: const Duration(days: 20),
    );
  }

  static bool verifyAccessToken({required String accessToken}) {
    try {
      JWT.verify(accessToken, SecretKey(JWTConstants.accesssTokenSecretKey));
      return true;
    } catch (_) {
      return false;
    }
  }

  static bool verifyRefreshToken({required String accessToken}) {
    try {
      JWT.verify(accessToken, SecretKey(JWTConstants.refreshTokenSecretKey));
      return true;
    } catch (_) {
      return false;
    }
  }

  static String getUserIdFromToken({required String accessToken}) {
    final jwt = JWT.decode(accessToken);
    return jwt.payload['userId'] as String;
  }
}
