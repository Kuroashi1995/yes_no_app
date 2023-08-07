enum FromWhom { mine, adivinator }

class Message {
  final String text;
  final String? imageUrl;
  final FromWhom fromWhom;

  const Message({required this.text, this.imageUrl, required this.fromWhom});
}
