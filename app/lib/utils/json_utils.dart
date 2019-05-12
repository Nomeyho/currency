Map<String, String> convertValueToString(json) {
  Map<String, String> result = {};

  json.forEach((key, value) {
    result[key] = value.toString();
  });

  return result;
}
