
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:books_app/features/home/domain/entity/book_entity.dart';

class BookDescModel extends Equatable {
  final Color color;
  final BookEntity book;
  const BookDescModel({
    required this.color,
    required this.book,
  });

  @override
  List<Object> get props => [color, book];
}
