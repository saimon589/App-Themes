import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension PageNavigation on BuildContext{
  Future<dynamic> push(Widget widget)async{
    return await Navigator.of(this).push(
        MaterialPageRoute(builder: (context)=>widget));
  }
  Future<dynamic> pushEnd(Widget widget)async {
    return await Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context)=>widget), (route) => false);
  }
  Future<dynamic> pop()async{
    return Navigator.of(this).pop();
  }
}