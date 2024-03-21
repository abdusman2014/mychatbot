import 'package:flutter/material.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  List<String> botChats = [
    "Nice to Meet you! How can I help you?",
    "Good Question, But i am sorry to let you know it is out of my scope!"
  ];
  String chat = "";
  List<String> userChats = [];
  var _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("ChatBot")),
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
                chat: "Hello! What is your name?",
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
            padding:
                const EdgeInsets.only(left: 20, bottom: 10, top: 10, right: 20),
            height: 60,
            //  width: double.infinity,
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
                    // onChanged: (val) {
                    //   // print(val);
                    //   chat = val;
                    // },
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      userChats.add(_controller.text);
                      if (botChats.length < userChats.length) {
                        botChats.add(
                            "Sorry! I am not able to help you at this moment.");
                      }
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
        child: Text(chat));
  }
}
