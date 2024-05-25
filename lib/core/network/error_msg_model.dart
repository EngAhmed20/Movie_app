import 'package:equatable/equatable.dart';

class ErrorMsgModel extends Equatable {
  final int statusCode;
  final String message;
  final bool sucess;
  const ErrorMsgModel(
      {required this.statusCode, required this.message, required this.sucess});

  @override
  // TODO: implement props
  List<Object?> get props => [statusCode, message, sucess];

  factory ErrorMsgModel.fromJson(Map<String, dynamic> json)=>
      ErrorMsgModel(statusCode:json['status_code'],
      message: json['status_message'],
      sucess: json['success']);




}