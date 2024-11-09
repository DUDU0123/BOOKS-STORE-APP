import 'package:equatable/equatable.dart';

class AuthorEntity extends Equatable {
  final String? id;
  final String? name;
  final DateTime? birthdate;
  final String? biography;

  const AuthorEntity({
    this.id,
    this.name,
    this.birthdate,
    this.biography,
  });
  

  @override
  List<Object?> get props => [id, name, birthdate, biography];
}
