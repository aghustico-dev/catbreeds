bool isNullOrEmpty(dynamic value) {
  return (["", "null", null, false, [], List.empty(), 0].contains(value));
}
