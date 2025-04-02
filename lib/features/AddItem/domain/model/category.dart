// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  final List<Document> documents;

  Category({
    required this.documents,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        documents: List<Document>.from(
            json["documents"].map((x) => Document.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
      };
}

class Document {
  final String name;
  final DocumentFields fields;
  final DateTime createTime;
  final DateTime updateTime;

  Document({
    required this.name,
    required this.fields,
    required this.createTime,
    required this.updateTime,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        name: json["name"],
        fields: DocumentFields.fromJson(json["fields"]),
        createTime: DateTime.parse(json["createTime"]),
        updateTime: DateTime.parse(json["updateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "fields": fields.toJson(),
        "createTime": createTime.toIso8601String(),
        "updateTime": updateTime.toIso8601String(),
      };
}

class DocumentFields {
  final BiscuitCategories biscuitCategories;

  DocumentFields({
    required this.biscuitCategories,
  });

  factory DocumentFields.fromJson(Map<String, dynamic> json) => DocumentFields(
        biscuitCategories:
            BiscuitCategories.fromJson(json["biscuit_categories"]),
      );

  Map<String, dynamic> toJson() => {
        "biscuit_categories": biscuitCategories.toJson(),
      };
}

class BiscuitCategories {
  final ArrayValue arrayValue;

  BiscuitCategories({
    required this.arrayValue,
  });

  factory BiscuitCategories.fromJson(Map<String, dynamic> json) =>
      BiscuitCategories(
        arrayValue: ArrayValue.fromJson(json["arrayValue"]),
      );

  Map<String, dynamic> toJson() => {
        "arrayValue": arrayValue.toJson(),
      };
}

class ArrayValue {
  final List<Value> values;

  ArrayValue({
    required this.values,
  });

  factory ArrayValue.fromJson(Map<String, dynamic> json) => ArrayValue(
        values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "values": List<dynamic>.from(values.map((x) => x.toJson())),
      };
}

class Value {
  final MapValue mapValue;

  Value({
    required this.mapValue,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        mapValue: MapValue.fromJson(json["mapValue"]),
      );

  Map<String, dynamic> toJson() => {
        "mapValue": mapValue.toJson(),
      };
}

class MapValue {
  final MapValueFields fields;

  MapValue({
    required this.fields,
  });

  factory MapValue.fromJson(Map<String, dynamic> json) => MapValue(
        fields: MapValueFields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "fields": fields.toJson(),
      };
}

class MapValueFields {
  final Id id;
  final Id name;

  MapValueFields({
    required this.id,
    required this.name,
  });

  factory MapValueFields.fromJson(Map<String, dynamic> json) => MapValueFields(
        id: Id.fromJson(json["id"]),
        name: Id.fromJson(json["name"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id.toJson(),
        "name": name.toJson(),
      };
}

class Id {
  final String stringValue;

  Id({
    required this.stringValue,
  });

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        stringValue: json["stringValue"],
      );

  Map<String, dynamic> toJson() => {
        "stringValue": stringValue,
      };
}
