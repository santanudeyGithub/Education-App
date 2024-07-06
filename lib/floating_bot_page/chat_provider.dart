import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Message {
  final String text;
  final String sender;
  final String timestamp;

  Message({required this.text, required this.sender, required this.timestamp});
}

class ChatProvider extends ChangeNotifier {
  List<Message> _messages = [];

  List<Message> get messages => _messages;

  void sendMessage(String text) async {
    final timestamp =
        DateTime.now().toLocal().toString().split(' ')[1].substring(0, 5);
    _messages.add(Message(text: text, sender: 'User', timestamp: timestamp));
    notifyListeners();

    final response = await http.post(
      Uri.parse('https://services.kommunicate.io/rest/ws/group/conversation'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'message': text}),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      _messages.add(Message(
          text: responseBody['reply'], sender: 'Bot', timestamp: timestamp));
      notifyListeners();
    }
  }
}
