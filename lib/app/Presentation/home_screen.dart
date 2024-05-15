import 'package:flutter/material.dart';
import 'package:my_chatbot/app/Presentation/chatbot_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Welcome To",
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Hopeline",
                style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                "assets/images/app_icon.jpeg",
                height: 150,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.all(16),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    HomeContainer(
                      title: "Chatbot",
                      description: "Converse with our therapeutic chatbot",
                      onPress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ChatbotScreen()));
                      },
                    ),
                    HomeContainer(
                      title: "Group Therapy",
                      description:
                          "Interact with other people who share the same issue",
                      onPress: () {},
                    ),
                    HomeContainer(
                      title: "PPS Approved",
                      description:
                          "In collaboration with Pakistan Psychological Society",
                      onPress: () {},
                    ),
                    HomeContainer(
                      title: "Personal Profile",
                      description: "Manage your personal profile",
                      onPress: () {},
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Positioned(
                // bottom: 0,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.green[800],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                ),
              )
            ],
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 40,
            bottom: 60,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: Colors.green[800],
                  border: Border.all(color: Colors.white, width: 6),
                  borderRadius: BorderRadius.circular(50)),
              child: const Icon(
                Icons.menu,
                size: 28,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HomeContainer extends StatelessWidget {
  const HomeContainer(
      {super.key,
      required this.title,
      required this.description,
      required this.onPress});
  final String title;
  final String description;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 30,
        height: 150,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(2, 6), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.green[200],
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
