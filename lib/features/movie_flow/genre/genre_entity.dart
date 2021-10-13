import 'package:flutter/foundation.dart';

import 'package:equatable/equatable.dart';

@immutable
class GenreEntity extends Equatable {
  final int id;
  final String name;

  const GenreEntity({required this.id, required this.name});

  factory GenreEntity.fromMap(Map<String, dynamic> data) => GenreEntity(
        id: data["id"],
        name: data["name"],
      );

  @override
  String toString() => "GenreEntity(id: $id, name: $name)";

  // Using equatable to do operator overloading (overriding the == operator to compare GenreEntity classes)
  @override
  List<Object> get props => [id, name];
}
