import 'package:movie_clean/core/network/error_msg_model.dart';

class ServerException implements Exception{
  final ErrorMsgModel errorMsgModel;
  const ServerException(this.errorMsgModel);
}