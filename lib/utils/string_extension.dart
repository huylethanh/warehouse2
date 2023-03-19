extension DefaultBehavior on String? {
  bool isNullOrEmptyEx() {
    return isNullOrEmpty(this);
  }
}

bool isNullOrEmpty(String? str) {
  return str == null || str.trim().isEmpty || str == 'null';
}
