import 'package:auth/interfaces/model_interface.dart';
import 'package:auth/models/user_model.dart';
import 'package:postgres/postgres.dart';

class BancoDados<T extends IModel> {
  Connection? conn;
  BancoDados._();

  static BancoDados? _instance;

  static BancoDados get instance {
    _instance ??= BancoDados._();
    return _instance!;
  }

  Future<void> init() async {
    conn = await Connection.open(
        Endpoint(
          host: 'localhost',
          database: 'pbd_auth',
          username: 'postgres',
          password: 'postgres',
        ),
        settings: ConnectionSettings(sslMode: SslMode.disable));

    await execute(UserModel.getQuery());
  }

  Future<bool> execute(String sql) async {
    await conn!.execute(sql);
    return true;
  }

  Future<List<Map<String, dynamic>>> query(String sql) async {
    final result = await conn!.execute(sql);
    return result.map((element) => element.toColumnMap()).toList();
  }
}
