class FirestorePath {
  static String imgFallback() => 'images/img_Fallback.jpg';
  static String imgCategory(String uid) => 'images/img_${uid.replaceAll(RegExp(r' '), '_')}.jpg';
}
