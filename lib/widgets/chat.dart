import 'package:ar_edu/constants%20/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constants /api_key.dart';
import '../models /chat_model.dart';
import 'loading_indicator.dart';

const backgroundColor = Color(0xff343541);
const botBackgroundColor = Color(0xff444654);

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

Future<String> generateResponse(String prompt) async {


  var url = Uri.https("api.openai.com", "/v1/completions");
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',

    },
    body: jsonEncode({
      "model": "text-davinci-003",
      "prompt": prompt,
      "temperature": 0.9,
      "max_tokens": 150,
      "top_p": 1,
      "frequency_penalty": 0,
      "presence_penalty": 0.6,


    }),
  );

  // Do something with the response
  Map<String, dynamic> newResponse = jsonDecode(response.body);
  return newResponse["choices"][0]["text"];


}

class _ChatPageState extends State<ChatPage> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: kPriColor,
        elevation: 2,
        title: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.white,
                ),
                child: Image.asset(
                  'assets/images/icon.png',
                  width: 45,
                ),
              ),
              const SizedBox(width: 10),
              const Text("Virtual Assistant ",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 15))
            ],
          ),
        ),
      ),
      backgroundColor: kChatBackground,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              _buildList(),
              Visibility(
                visible: isLoading,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TypingIndicator()
                ),
              ),
              Row(
                children: [
                  _buildInput(),
                  _buildSubmit(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmit() {
    return Visibility(
      visible: !isLoading,
      child: Container(
        color: botBackgroundColor,
      ),
    );
  }

  Expanded _buildInput() {
    return Expanded(
      child: Container(
       margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  hintText: 'Type a message...',
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ),
            IconButton(
              onPressed: () async {
                setState(
                  () {
                    _messages.add(
                      ChatMessage(
                        text: _textController.text,
                        chatMessageType: ChatMessageType.user,
                      ),
                    );
                    isLoading = true;
                  },
                );
                var input = _textController.text;
                _textController.clear();
                Future.delayed(const Duration(milliseconds: 50))
                    .then((_) => _scrollDown());
                generateResponse(input).then((value) {
                  setState(() {
                    isLoading = false;
                    _messages.add(
                      ChatMessage(
                        text: value,
                        chatMessageType: ChatMessageType.bot,
                      ),
                    );
                  });
                });
                _textController.clear();
                Future.delayed(const Duration(milliseconds: 50))
                    .then((_) => _scrollDown());
              },
              icon: const Icon(
                Icons.send_rounded,
                color: kPriColor,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildList() {
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          var message = _messages[index];
          return ChatMessageWidget(
            text: message.text,
            chatMessageType: message.chatMessageType,
            isUserMessage: message.chatMessageType == ChatMessageType.user,
          );
        },
      ),
    );
  }


  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({
    Key? key,
    required this.text,
    required this.chatMessageType,
    required this.isUserMessage,
  }) : super(key: key);

  final String text;
  final ChatMessageType chatMessageType;
  final bool isUserMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: isUserMessage ? kChatUser : kChatBot,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: isUserMessage ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}

