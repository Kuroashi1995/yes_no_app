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
  bool hat = false;

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWhom: FromWhom.mine);
    messages.add(newMessage);
    if (text == '*se pone el sombrero*') {
      hat = true;
      messages.add(
        const Message(
            text: 'PERRY EL ORNITORRINCO?',
            fromWhom: FromWhom.adivinator,
            imageUrl:
                'https://64.media.tumblr.com/1a486a42331daa143eea1f74a94e559c/ba8549d4bd1dd368-28/s1280x1920/4e6ca9f1137031f28e666b45f883e0767aa40f06.gif'),
      );
    }
    if (text.endsWith('?')) {
      getAdivination();
    }

    notifyListeners();
    scrollToBottom();
  }

  Future<void> getAdivination() async {
    messages.add(
      await yesNoAnswer.getAnswer(),
    );
    notifyListeners();
  }

  void scrollToBottom() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
  }
}
