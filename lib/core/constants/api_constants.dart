class ApiConstants {
  static const baseUrl = "https://assessment.eltglobal.in/";
  static const registerUrl = '${baseUrl}api/auth/register';
  static const loginUrl = '${baseUrl}api/auth/login';
  static const authorsUrl = '${baseUrl}api/authors';
  static allBooks({required int page, required int limit})=> '${baseUrl}api/books?page=$page&limit=$limit';
}