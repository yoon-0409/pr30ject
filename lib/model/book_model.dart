class Book {
  String title;
  int pages;
  Book({required this.title, required this.pages});
  Book.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        pages = map['pages'];
}
