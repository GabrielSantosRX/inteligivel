class FirestorePath {
  static String imgFallback() =>
      'https://firebasestorage.googleapis.com/v0/b/inteligivel-app.appspot.com/o/images%2Fimg_Fallback.jpg?alt=media&token=5272cd28-061c-460d-ba5a-2af16ed872bd';
  static String imgCategory(String uid) => 'images/img_${uid.replaceAll(RegExp(r' '), '_')}.jpg';
}
