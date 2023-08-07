import 'dart:developer';

import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValueChange;
  final textFieldController = TextEditingController();
  final textFieldNode = FocusNode();
  MessageFieldBox({
    super.key,
    required this.onValueChange,
  });
  @override
  Widget build(BuildContext context) {
    final inputOutlineBorder = UnderlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(20));
    return TextFormField(
      controller: textFieldController,
      focusNode: textFieldNode,
      decoration: InputDecoration(
        focusedBorder: inputOutlineBorder,
        enabledBorder: inputOutlineBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send),
          onPressed: () async {
            onValueChange(textFieldController.value.text);
            textFieldController.clear();
            log('request focus');
            FocusScope.of(context).requestFocus(textFieldNode);
          },
        ),
      ),
      onFieldSubmitted: (value) {
        onValueChange(value);
        textFieldController.clear();
        textFieldNode.requestFocus();
      },
      onTapOutside: (event) {
        textFieldNode.unfocus();
      },
    );
  }
}
