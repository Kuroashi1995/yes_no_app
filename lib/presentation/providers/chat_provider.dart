import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  final YesNoAnswer yesNoAnswer = YesNoAnswer();
  List<Message> messages = [
    const Message(text: "Hola Adivinator", fromWhom: FromWhom.mine),
    const Message(text: "Estas ahi?", fromWhom: FromWhom.mine),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWhom: FromWhom.mine);
    messages.add(newMessage);

    notifyListeners();
    scrollToBottom();
  }

  Future<void> getAdivination() {}

  void scrollToBottom() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
  }
}
