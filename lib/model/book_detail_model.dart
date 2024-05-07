class BookDetailModel {
  String title;
  String imgURL;
  String author;
  String foreword;
  String publisher;
  String isbn;
  String isbn13;
  String pages;

  BookDetailModel({
    this.title = 'Unknown Title',
    this.imgURL = 'https://img.icons8.com/ios/100/no-image.png',
    this.author = 'Unknown Author',
    this.foreword = '',
    this.publisher = 'Unknown Publisher',
    this.isbn = '',
    this.isbn13 = '',
    this.pages = '',
  });

  BookDetailModel.fromMap(Map<String, dynamic> map)
      : title = map['title'] ?? 'Unknown Title',
        imgURL = map['cover'] ?? 'https://img.icons8.com/ios/100/no-image.png',
        author = map['author'] ?? 'Unknown Author',
        foreword = map['description'] ?? '',
        publisher = map['publisher'] ?? 'Unknown Publisher',
        isbn = map['isbn'] ?? '',
        isbn13 = map['isbn13'] ?? '',
        pages = map['itemPage'] ?? '0';

  BookDetailModel.fromJson(Map<String, dynamic> map)
      : title = map['title'] ?? 'Unknown Title',
        imgURL = map['cover'] ?? 'https://img.icons8.com/ios/100/no-image.png',
        author = map['author'] ?? 'Unknown Author',
        foreword = map['description'] ?? '',
        publisher = map['publisher'] ?? 'Unknown Publisher',
        isbn = map['isbn'] ?? '',
        isbn13 = map['isbn13'] ?? '',
        pages = map['itemPage'] ?? '0';
}
