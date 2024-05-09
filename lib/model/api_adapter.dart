import 'dart:convert';
import 'book_model.dart';

// JSON 데이터를 파싱하고, Book 객체의 목록을 반환하는 함수
List<Book> parseBooks(String responseBody) {
  try {
    // JSON 문자열을 파싱
    final jsonData = json.decode(responseBody);

    // JSON 데이터가 'item' 키 아래의 리스트인지 확인
    if (jsonData is Map &&
        jsonData.containsKey('item') &&
        jsonData['item'] is List) {
      // 'item' 리스트를 Book 객체 리스트로 변환
      final List<dynamic> itemList = jsonData['item'];
      return itemList.map((item) => Book.fromJson(item)).toList();
    } else {
      // 예상된 구조가 아닐 경우 빈 리스트 반환
      print(jsonData['item']);
      print(jsonData['errorCode']);
      print(jsonData['errorMessage']);
      print("Unexpected JSON structure");
      return [];
    }
  } catch (e) {
    // JSON 파싱 중 오류 발생 시, 에러 메시지 출력
    print("Error parsing JSON: $e");
    return [];
  }
}

BookDetail parseBookDetail(String responseBody) {
  final Map<String, dynamic> data = jsonDecode(responseBody);

  // 'item' 배열이 비어있는지 확인합니다.
  if (data.containsKey('item') &&
      data['item'] is List &&
      data['item'].isNotEmpty) {
    // 'item' 배열의 첫 번째 요소를 가져와 'BookDetail' 객체로 변환합니다.
    final Map<String, dynamic> itemData = data['item'][0];
    return BookDetail.fromJson(itemData);
  } else {
    // 'item' 배열이 비어있거나 유효한 JSON 구조가 아닐 경우 예외를 던집니다.

    throw Exception("No book details found in the provided JSON.");
  }
}

BookDetail _createDefaultBookDetail() {
  return BookDetail(
    title: 'error',
    isbn: '',
    isbn13: '',
    imgURL: '', // 기본 이미지
    publisher: '',
    author: '',
    foreword: '',
    pages: '',
  );
}
