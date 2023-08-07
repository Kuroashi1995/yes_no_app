import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
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
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.scrollController,
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {
                  return chatProvider.messages[index].fromWhom == FromWhom.mine
                      ? MessageBubble(message: chatProvider.messages[index])
                      : AdivinatorMessage(
                          message: chatProvider.messages[index],
                        );
                },
              ),
            ),
            MessageFieldBox(onValueChange: chatProvider.sendMessage),
          ],
        ),
      ),
    );
  }
}
