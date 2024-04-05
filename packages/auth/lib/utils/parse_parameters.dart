class ParseParameters {
  static String parseParameters(Map<String, dynamic> data) {
    final entrys = data.entries.map((entry) {
      String value =
          entry.value is String ? "'${entry.value}'" : entry.value.toString();
      return "${entry.key} = $value";
    }).toList();
    return entrys.join(',');
  }
}