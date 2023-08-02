import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});
  @override
  Widget build(BuildContext context) {
    final textFieldController = TextEditingController();
    final textFieldNode = FocusNode();
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
          onPressed: () {
            print("Button Value ${textFieldController.value.text}");
            textFieldController.clear();
          },
        ),
      ),
      onFieldSubmitted: (value) {
        print("submited value: $value");
        textFieldController.clear();
        textFieldNode.requestFocus();
      },
      onTapOutside: (event) {
        textFieldNode.unfocus();
      },
    );
  }
}
