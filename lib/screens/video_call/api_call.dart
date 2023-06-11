import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//Auth token we will use to generate a meeting and connect to it
String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiJjYzkwZWM2MC1iMTU4LTQzNjYtODlmNS1jY2NhMGRhODMzODEiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTY4NjQ4NTIxOCwiZXhwIjoxNjg3MDkwMDE4fQ.wZ_GQhkH4IjxewIYy3F0IBZorelbO0TSUHAomAtZaCs";

// API call to create meeting
Future<String> createMeeting() async {
  final http.Response httpResponse = await http.post(
    Uri.parse("https://api.videosdk.live/v2/rooms"),
    headers: {'Authorization': token},
  );

//Destructuring the roomId from the response
  debugPrint(json.decode(httpResponse.body)['roomId'] +
      'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
  return json.decode(httpResponse.body)['roomId'];
}
