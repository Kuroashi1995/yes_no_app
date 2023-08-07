import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  const MessageBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: colors.primary,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(message.text),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(6, 0, 0, 0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.wallpapersafari.com/35/22/Y9WFlq.jpg'),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
