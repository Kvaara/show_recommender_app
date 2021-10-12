import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

import 'package:show_recommender_app/features/movie_flow/genre/genre_entity.dart';

@immutable
class Genre extends Equatable {
  final String name;
  final bool isSelected;
  final int id;

  const Genre({required this.name, this.id = 0, this.isSelected = false});
  factory Genre.fromEntity(GenreEntity entity) => Genre(
        name: entity.name,
        id: entity.id,
        isSelected: false,
      );

  Genre toggleSelected() {
    return Genre(
      name: name,
      id: id,
      isSelected: !isSelected,
    );
  }

  @override
  String toString() => "Genre(name: $name, isSelected: $isSelected, id: $id)";

  // Override the equal operator (now we can compary two instances) and override the hashcode by using Equatable
  @override
  List<Object> get props => [name, isSelected, id];
}
