extension ListExtension on List {
  T getOrElse<T>(int index, T Function(int) defaultValue) {
    if (index >= 0 && index < this.length) {
      return this[index];
    }

    return defaultValue(index);
  }
}
