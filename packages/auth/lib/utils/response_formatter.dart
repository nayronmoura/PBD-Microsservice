import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

class ResponseFormatter {
  static Response sucess({required dynamic message}) {
    return Response.ok(jsonEncode(message), headers: {
      'Content-Type':
          ContentType('application', 'json', charset: 'utf-8').toString()
    });
  }

  static Response internalError({required String message}) {
    return Response.internalServerError(
        body: jsonEncode({'result': message}),
        headers: {
          'Content-Type':
              ContentType('application', 'json', charset: 'utf-8').toString()
        });
  }

  static Response badRequest({required String message}) {
    return Response.badRequest(body: jsonEncode({'error': message}), headers: {
      'Content-Type':
          ContentType('application', 'json', charset: 'utf-8').toString()
    });
  }

  static Response unAutorized({required String message}) {
    return Response.unauthorized(jsonEncode({'error': message}), headers: {
      'Content-Type':
          ContentType('application', 'json', charset: 'utf-8').toString()
    });
  }

  static Response forbidden({required String message}) {
    return Response.forbidden(jsonEncode({'result': message}), headers: {
      'Content-Type':
          ContentType('application', 'json', charset: 'utf-8').toString()
    });
  }
}
