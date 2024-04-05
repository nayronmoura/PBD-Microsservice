abstract interface class IModel<T> {
  static String getQuery() {
    throw UnimplementedError();
  }
}
