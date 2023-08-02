import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/adivinator_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://d23.com/app/uploads/2020/08/780w-463h_082820_10-best-inators_3.jpg'),
          ),
        ),
        title: const Text("THE ADIVINATOR"),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return (index % 2 == 0)
                      ? const MessageBubble()
                      : const AdivinatorMessage();
                },
              ),
            ),
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}