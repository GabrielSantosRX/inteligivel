class FirestorePath {
  static String imgFallback() =>
      'https://firebasestorage.googleapis.com/v0/b/inteligivel-app.appspot.com/o/images%2Fimg_Fallback.jpg?alt=media&token=5272cd28-061c-460d-ba5a-2af16ed872bd';

  static String imgFallbackSubject() =>
      'https://firebasestorage.googleapis.com/v0/b/inteligivel-app.appspot.com/o/images%2Fsubjects%2FOutros.png?alt=media&token=c3a75fe7-6fc3-4c22-948a-04c048910c66';

  static String imgCategory(String uid) => 'images/img_${uid.replaceAll(RegExp(r' '), '_')}.jpg';
  static String imgSubject(String uid) => 'images/subjects/$uid.png';
}
