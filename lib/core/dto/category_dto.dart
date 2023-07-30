import 'package:json_annotation/json_annotation.dart';

part 'category_dto.g.dart';

@JsonSerializable()
class CategoryDTO {
  String? name;
  CategoryDTO? child;

  CategoryDTO({
    this.name,
    this.child,
  });

  factory CategoryDTO.fromJson(Map<String, dynamic> json) => _$CategoryDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDTOToJson(this);
}
