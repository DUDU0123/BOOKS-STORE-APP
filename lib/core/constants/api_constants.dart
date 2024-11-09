class ApiConstants {
  static const baseUrl = "https://assessment.eltglobal.in/";
  static const registerUrl = '${baseUrl}api/auth/register';
  static const loginUrl = '${baseUrl}api/auth/login';
  static const authorsUrl = '${baseUrl}api/authors';
  static oneAuthor({required String authorId}) => '${baseUrl}api/authors/$authorId';
  static allBooks({required int page, required int limit})=> '${baseUrl}api/books?page=$page&limit=$limit';
  static addRating({required String id})=> '${baseUrl}api/books/$id/ratings:add';
  static oneBook({required String bookId})=> '${baseUrl}api/books/$bookId';
}