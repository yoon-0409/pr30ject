class Book {
  String title;
  String imgURL;
  String author;
  String foreword;

  Book({
    required this.title,
    required this.imgURL,
    required this.author,
    required this.foreword,
  });

  Book.fromMap(Map<String, dynamic> map)
      : title = map['title'] ?? '', // null인 경우 기본값으로 설정
        imgURL = map['link'] ??
            'https://img.icons8.com/ios/100/no-image.png', // 기본 URL로 설정하거나 빈 문자열
        author = map['author'] ?? '', // null인 경우 기본값 설정
        foreword = map['description'] ?? ''; // null인 경우 기본값 설정

  Book.fromJson(Map<String, dynamic> map)
      : title = map['title'] ?? 'Untitled', // null인 경우 기본값으로 설정
        imgURL = map['link'] ??
            'https://img.icons8.com/ios/100/no-image.png', // 기본 URL로 설정하거나 빈 문자열
        author = map['author'] ?? 'Unknown Author', // null인 경우 기본값 설정
        foreword = map['description'] ?? 'No description'; // null인 경우 기본값 설정
}
