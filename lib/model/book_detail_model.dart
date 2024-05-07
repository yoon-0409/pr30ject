class BookDetail {
  String title;
  String imgURL;
  String author;
  String foreword;
  String publisher;
  String isbn;
  String isbn13;
  int pages;

  BookDetail({
    required this.title,
    required this.imgURL,
    required this.author,
    required this.foreword,
    required this.publisher,
    required this.isbn,
    required this.pages,
    required this.isbn13,
  });

  BookDetail.fromMap(Map<String, dynamic> map)
      : title = map['title'] ?? '',
        imgURL = map['link'] ?? 'https://img.icons8.com/ios/100/no-image.png',
        author = map['author'] ?? '',
        foreword = map['description'] ?? '',
        publisher = map['publisher'] ?? '',
        isbn = map['isbn'] ?? '',
        isbn13 = map['isbn13'] ?? '',
        pages = map['itemPage'] ?? '';

  BookDetail.fromJson(Map<String, dynamic> map)
      : title = map['title'] ?? '',
        imgURL = map['link'] ?? 'https://img.icons8.com/ios/100/no-image.png',
        author = map['author'] ?? '',
        foreword = map['description'] ?? '',
        publisher = map['publisher'] ?? '',
        isbn = map['isbn'] ?? '',
        isbn13 = map['isbn13'] ?? '',
        pages = map['itemPage'] ?? '';
}
