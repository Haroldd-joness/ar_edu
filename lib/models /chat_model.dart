import 'package:flutter/material.dart';

enum ChatMessageType {user, bot}

class ChatMessage{
  late final String text;
  late final ChatMessageType chatMessageType;

  ChatMessage({
    required this.text,
    required this.chatMessageType
  });


}