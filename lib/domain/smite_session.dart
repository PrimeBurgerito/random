import 'dart:async';
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:random/util/smite_util.dart';

part 'smite_session.g.dart';

Future<SmiteSession> fetchSession() async {
  final response = await smiteFetch('createsession', null);
  final responseJson = jsonDecode(response.body);

  return SmiteSession.fromJson(responseJson);
}

@JsonSerializable()
class SmiteSession {
  @JsonKey(name: 'ret_msg')
  final String message;
  @JsonKey(name: 'session_id')
  final String sessionId;
  @JsonKey(fromJson: _dateTimeFromJson)
  final DateTime timestamp;

  SmiteSession(this.message, this.sessionId, this.timestamp);

  factory SmiteSession.fromJson(Map<String, dynamic> json) =>
      _$SmiteSessionFromJson(json);

  Map<String, dynamic> toJson() => _$SmiteSessionToJson(this);
}

DateTime _dateTimeFromJson(String value) =>
    DateFormat('M/dd/yyyy h:mm:ss a').parseUtc(value);
