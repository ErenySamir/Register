import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecieveData extends StatefulWidget{
  //constuctor
  String firstName;
  RecieveData({required this.firstName});
  @override
  State<RecieveData> createState() {
    return RecieveDataState();
  }

}
class RecieveDataState extends State<RecieveData>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.firstName),
      ),
    );
  }
}
