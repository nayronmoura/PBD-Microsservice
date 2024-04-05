import 'dart:convert';

import 'package:auth/banco/banco_dados.dart';
import 'package:auth/interfaces/handle_interface.dart';
import 'package:auth/models/user_model.dart';
import 'package:auth/utils/jwt_utils.dart';
import 'package:auth/utils/response_formatter.dart';
import 'package:crypto/crypto.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class AuthController extends IHandler {
  final bancoDados = BancoDados.instance;

  @override
  Router get handler {
    final router = Router(notFoundHandler: notFound);

    router.post('/token', _login);
    router.post('/validation', _validation);

    return router;
  }

  Future<Response> _login(Request request) async {
    String body = await request.readAsString();
    try {
      final auth = UserModel.fromJson(jsonDecode(body));

      final password = await bancoDados
          .query("select password from tb_user where name='${auth.name}'");

      if (password.isEmpty) {
        return ResponseFormatter.badRequest(message: 'user not found');
      }
      // final encripted = encode(auth.password); TODO: implementar criptografia no futuro

      if (password.first['password'] == auth.password) {
        final jwt = JWTUtils.generateAccessToken(data: auth.name);

        return ResponseFormatter.sucess(message: {'token': jwt});
      } else {
        return ResponseFormatter.badRequest(message: "user not found");
      }
    } catch (e) {
      return Response.internalServerError();
    }
  }

  Future<Response> _validation(Request request) async {
    String body = await request.readAsString();
    try {
      if (body.isEmpty) {
        return ResponseFormatter.badRequest(message: 'token is required');
      }

      final token = jsonDecode(body);

      if (token['token'] == null) {
        return ResponseFormatter.badRequest(message: 'token is required');
      }

      if (JWTUtils.verifyAccessToken(accessToken: token['token'])) {
        return ResponseFormatter.sucess(message: {});
      } else {
        return ResponseFormatter.unAutorized(message: "token expired");
      }
    } catch (e) {
      return Response.internalServerError();
    }
  }

  // Future<Response> _signup(Request request) async {
  //   String body = await request.readAsString();
  //   try {
  //     final auth = UserModel.fromJson(jsonDecode(body));

  //     final created = await bancoDados.execute(
  //         """insert into tb_user (firstname, lastname, email, password) values ('${auth.fistName}', '${auth.lastName}', '${auth.email}', '${encode(auth.password)}')""");
  //     if (created) {
  //       final user = await bancoDados
  //           .query("select id from tb_user where email='${auth.email}'");
  //       auth.copyWith(id: user.first['id']);
  //     return Response.ok(auth.)

  //     }

  //   } catch (e) {
  //     return Response.internalServerError();
  //   }
  // }

  // String encode(String password) { --> TODO: MÉTODO PARA CRIPTOGRAFIA DE SENHAS
  //   final toUTF8 = utf8.encode(password);
  //   return sha1.convert(toUTF8).toString();
  // }
}
