import 'package:auth/utils/response_formatter.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

abstract class IHandler {
  Router get handler;

  Response notFound(Request request) =>
      ResponseFormatter.forbidden(message: 'rota não encontrada');
}