import 'package:json_annotation/json_annotation.dart';

part "note.g.dart";

@JsonSerializable()
class Note {
  String? title;
  String? content;
  String id;
  DateTime date_created;
  DateTime? date_last_edited;
  String idUsuario;
  Note(
      {this.title = " ",
      this.content = " ",
      required this.date_created,
      this.date_last_edited,
      this.id = "",
      this.idUsuario = ""});

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);
}
