class Book {
  String title;
  String isbn;
  String isbn13;
  String imgURL;
  String author;
  String foreword;

  Book({
    required this.title,
    required this.isbn,
    required this.isbn13,
    required this.imgURL,
    required this.author,
    required this.foreword,
  });

  Book.fromMap(Map<String, dynamic> map)
      : title = map['title'] ?? '', // null인 경우 기본값으로 설정
        imgURL = map['cover'] ??
            'https://img.icons8.com/ios/100/no-image.png', // 기본 URL로 설정하거나 빈 문자열
        isbn = map['isbn'] ?? '',
        isbn13 = map['isbn13'] ?? '',
        author = map['author'] ?? '', // null인 경우 기본값 설정
        foreword = map['description'] ?? ''; // null인 경우 기본값 설정

  Book.fromJson(Map<String, dynamic> map)
      : title = map['title'] ?? 'Untitled', // null인 경우 기본값으로 설정
        imgURL = map['cover'] ??
            'https://img.icons8.com/ios/100/no-image.png', // 기본 URL로 설정하거나 빈 문자열
        isbn = map['isbn'] ?? '',
        isbn13 = map['isbn13'] ?? '',
        author = map['author'] ?? 'Unknown Author', // null인 경우 기본값 설정
        foreword = map['description'] ?? 'No description'; // null인 경우 기본값 설정
}

class BookDetail {
  String title;
  String isbn;
  String isbn13;
  String imgURL;
  String publisher;
  String author;
  String foreword;
  String pages;

  BookDetail({
    required this.title,
    required this.isbn,
    required this.isbn13,
    required this.imgURL,
    required this.publisher,
    required this.author,
    required this.foreword,
    required this.pages,
  });

  BookDetail.fromMap(Map<String, dynamic> map)
      : title = map['title'] ?? '', // null인 경우 기본값으로 설정
        imgURL = map['cover'] ??
            'https://img.icons8.com/ios/100/no-image.png', // 기본 URL로 설정하거나 빈 문자열
        isbn = map['isbn'] ?? '',
        isbn13 = map['isbn13'] ?? '',
        publisher = map['publisher'] ?? '',
        author = map['author'] ?? '', // null인 경우 기본값 설정

        pages =
            map.containsKey('subInfo') && map['subInfo'].containsKey('itemPage')
                ? map['subInfo']['itemPage'].toString()
                : '',
        foreword = map['description'] ?? ''; // null인 경우 기본값 설정

  BookDetail.fromJson(Map<String, dynamic> map)
      : title = map['title'] ?? 'Untitled', // null인 경우 기본값으로 설정
        imgURL = map['cover'] ??
            'https://img.icons8.com/ios/100/no-image.png', // 기본 URL로 설정하거나 빈 문자열
        isbn = map['isbn'] ?? '',
        isbn13 = map['isbn13'] ?? '',
        publisher = map['publisher'] ?? '',
        author = map['author'] ?? 'Unknown Author', // null인 경우 기본값 설정
        pages =
            map.containsKey('subInfo') && map['subInfo'].containsKey('itemPage')
                ? map['subInfo']['itemPage'].toString()
                : '',
        foreword = map['description'] ?? 'No description'; // null인 경우 기본값 설정

  BookDetail.init()
      : title = '',
        imgURL = '',
        isbn = '',
        isbn13 = '',
        publisher = '',
        author = '',
        pages = '',
        foreword = '';
}
