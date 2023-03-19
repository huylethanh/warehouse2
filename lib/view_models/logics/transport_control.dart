class TransportControl {
  String? currentCode;
  int? sessionId;
  //var opening: Boolean = false

  bool control(String barcode) {
    // user has not been set any transport to load
    if (currentCode == null) {
      // open transport
      currentCode = barcode;
      return true;
    } else if (barcode == currentCode) {
      // user scan this transport again -> close
      currentCode = null;
      return false;
    }
    return false;
  }

  void open(String code, int sId) {
    currentCode = code;
    sessionId = sId;
  }

  void close() {
    currentCode = null;
    sessionId = 0;
  }

  bool requestClose(String code) {
    return currentCode == code;
  }

  bool isOpen() {
    return currentCode != null;
  }
}
