import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Genre extends Equatable {
  final String name;
  final bool isSelected;
  final int id;
  const Genre({required this.name, this.id = 0, this.isSelected = false});

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
