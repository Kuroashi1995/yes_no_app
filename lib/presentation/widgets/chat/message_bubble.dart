import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final bool hat;
  const MessageBubble({
    super.key,
    required this.message,
    this.hat = false,
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
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(hat == true
                    ? 'https://pbs.twimg.com/profile_images/1276291982/Perry_el_Ornitorrinco_by_KiiluDoki_400x400.png'
                    : 'https://cdn.wallpapersafari.com/35/22/Y9WFlq.jpg'),
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
