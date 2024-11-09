import 'package:books_app/core/constants/database_constants.dart';
import 'package:books_app/features/authors/domain/entity/author_entity.dart';

class AuthorModel extends AuthorEntity {
  const AuthorModel({
    String? authorId,
    String? authorName,
    DateTime? authorBirthdate,
    String? authorBiography,
  }) : super(
          id: authorId,
          name: authorName,
          birthdate: authorBirthdate,
          biography: authorBiography,
        );

  factory AuthorModel.fromJson({required Map<String, dynamic> json}) {
    return AuthorModel(
      authorId: json[dbId] as String,
      authorName: json[dbAuthorName] as String,
      authorBirthdate: DateTime.parse(json[dbAuthorBirthDate] as String),
      authorBiography: json[dbAuthorBio] as String,
    );
  }
}
