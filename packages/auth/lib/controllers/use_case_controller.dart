import 'package:auth/controllers/auth_controller.dart';
import 'package:auth/interfaces/handle_interface.dart';
import 'package:shelf_router/shelf_router.dart';

class UseCaseController extends IHandler {
  static const String autenticationRoute = "/api/vi/authentication";
  @override
  Router get handler {
    final router = Router(notFoundHandler: notFound);

    // ignore: implicit_call_tearoffs
    router.mount(autenticationRoute, AuthController().handler);

    return router;
  }
}
