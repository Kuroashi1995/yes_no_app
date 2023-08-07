import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class YesNoAnswer {
  final _dio = Dio();
  Future<Message> getAnswer() {
    final response = _dio.get("https://yesno.wtf/api");
    return Message(fromWhom: FromWhom.adivinator);
  }
}
