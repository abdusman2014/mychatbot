import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_tts/flutter_tts.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  List<String> botChats = [];
  List<String> userChats = [];
  var _controller = TextEditingController();
  FlutterTts flutterTts = FlutterTts();

  Future<void> getBotResponse(String userMessage) async {
   try {
      var url = Uri.parse('http://192.168.18.30:5000/generate'); // Replace with your server IP
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"prompt": userMessage}),
      );

     if (response.statusCode == 200) {
       var responseBody = json.decode(response.body);
        var generatedText = responseBody['generated_text'];

        // Remove [INST] and [/INST] tags
        generatedText = generatedText.replaceAll(RegExp(r'\[INST\]|\[\/INST\]'), '');

       setState(() {
          botChats.add(generatedText);
        });
      } else {
        setState(() {
          botChats.add("Sorry, I couldn't process your request.");
        });
      }
    } catch (e) {
      setState(() {
        botChats.add("Error: $e");
      });
    }
  }

  Future<void> _speak(String text) async {
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("hopeline")),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: ChatWidget(
                chat: "Hi! What's your name?",
                isChatBot: true,
              )),
          Expanded(
            child: ListView.builder(
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: ChatWidget(
                          chat: userChats[index],
                          isChatBot: false,
                        )),
                    if (botChats.asMap().containsKey(index))
                      Align(
                          alignment: Alignment.centerLeft,
                          child: ChatWidget(
                            chat: botChats[index],
                            isChatBot: true,
                          )),
                  ],
                );
              }),
              itemCount: userChats.length,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10, right: 20),
            height: 60,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      String userMessage = _controller.text;
                      userChats.add(userMessage);
                      getBotResponse(userMessage); // Send user message to the server
                      _controller.clear();
                    });
                  },
                  backgroundColor: Colors.green,
                  elevation: 0,
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  onPressed: () {
                    String textToSpeak = _controller.text;
                    _speak(textToSpeak); // Convert entered text to speech
                  },
                  backgroundColor: Colors.blue,
                  elevation: 0,
                  child: const Icon(
                    Icons.mic,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.chat, required this.isChatBot});

  final String chat;
  final bool isChatBot;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(8),
              bottomLeft: Radius.circular(isChatBot ? 0 : 8),
              bottomRight: Radius.circular(isChatBot ? 8 : 0),
              topRight: const Radius.circular(8),
            )),
        child: Text(chat, style: TextStyle(color: Colors.white), softWrap: true));
  }
}
