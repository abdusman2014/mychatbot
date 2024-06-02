import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GroupChatScreen extends StatefulWidget {
  const GroupChatScreen({super.key});

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  List<String> userAli = [
    "Nice to Meet you! How can I help you?",
    "Good Question, But i am sorry to let you know it is out of my scope!"
  ];
  List<String> userTalha = [
    "Nice to Meet you! How can I help you?",
    "Good Question, But i am sorry to let you know it is out of my scope!"
  ];
  String user1 = "Ali";
  String user2 = "Talha";
  String chat = "";
  List<String> userChats = [];
  var _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Group Chat")),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: ChatWidget(
                chat: "Hello! What is your name?",
                isChatBot: true,
                userName: user1,
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
                          userName: "Me",
                        )),
                    if (userAli.asMap().containsKey(index))
                      Align(
                          alignment: Alignment.centerLeft,
                          child: ChatWidget(
                            chat: userAli[index],
                            isChatBot: true,
                            userName: user1,
                          )),
                    if (userAli.asMap().containsKey(index))
                      Align(
                          alignment: Alignment.centerLeft,
                          child: ChatWidget(
                            chat: userTalha[index],
                            isChatBot: true,
                            userName: user2,
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
                      if (userAli.length < userChats.length) {
                        userAli.add(
                            "Sorry! I am not able to help you at this moment.");
                        userTalha.add(
                            "Sorry! I am also not able to help you at this moment.");
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
  const ChatWidget(
      {super.key,
      required this.chat,
      required this.isChatBot,
      required this.userName});

  final String chat;
  final bool isChatBot;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            userName,
          ),
        ),
        Container(
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
            child: Text(chat)),
      ],
    );
  }
}
