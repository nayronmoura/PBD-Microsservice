import 'package:auth/banco/banco_dados.dart';
import 'package:auth/controllers/use_case_controller.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

void main(List<String> arguments) async {
  await BancoDados.instance.init();
  final handler = Pipeline().addMiddleware(logRequests()).addHandler((request) {
    return UseCaseController().handler(request);
  });
  final server = await shelf_io.serve(handler, 'localhost', 15001);

  print('Servidor em http://${server.address.host}:${server.port}');
}
