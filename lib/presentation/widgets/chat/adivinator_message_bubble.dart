import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class AdivinatorMessage extends StatelessWidget {
  final Message message;

  const AdivinatorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(message.imageUrl ??
                    'https://d23.com/app/uploads/2020/08/780w-463h_082820_10-best-inators_3.jpg'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: colors.secondary,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(message.text),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        _ImageBubble(),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        "https://yesno.wtf/assets/no/31-cc391a4c0332a4ce5b4d4666f64a7b4a.gif",
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          return loadingProgress == null
              ? child
              : Container(
                  width: size.width * 0.7,
                  height: 150,
                  child: const Text("Adivinator esta enviando una imagen"),
                );
        },
      ),
    );
  }
}
