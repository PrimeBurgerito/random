import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:random/util/smite_util.dart';

part 'smite_god.g.dart';

Future<List<SmiteGod>> fetchGods(String sessionId) async {
  final response = await smiteFetch('getgods', sessionId);
  final Iterable responseJson = jsonDecode(response.body);
  final Iterable gods = responseJson.map((json) => SmiteGod.fromJson(json));
  return List<SmiteGod>.from(gods);
}

@JsonSerializable()
class SmiteGod {
  final String name;

  SmiteGod(this.name);

  factory SmiteGod.fromJson(Map<String, dynamic> json) =>
      _$SmiteGodFromJson(json);

  Map<String, dynamic> toJson() => _$SmiteGodToJson(this);
}
