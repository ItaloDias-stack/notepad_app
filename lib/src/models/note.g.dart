// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) => Note(
      title: json['title'] as String? ?? " ",
      content: json['content'] as String? ?? " ",
      date_created: DateTime.parse(json['date_created'] as String),
      date_last_edited: json['date_last_edited'] == null
          ? null
          : DateTime.parse(json['date_last_edited'] as String),
      id: json['id'] as String? ?? "",
      idUsuario: json['idUsuario'] as String? ?? "",
    );

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'id': instance.id,
      'date_created': instance.date_created.toIso8601String(),
      'date_last_edited': instance.date_last_edited?.toIso8601String(),
      'idUsuario': instance.idUsuario,
    };
