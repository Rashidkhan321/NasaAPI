import 'package:flutter/material.dart';

class detailScreen extends StatefulWidget {
  final imagescr;
  const detailScreen({Key? key, required this.imagescr}) : super(key: key);

  @override
  State<detailScreen> createState() => _detailScreenState();
}

class _detailScreenState extends State<detailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.network(widget.imagescr,
        fit: BoxFit.cover,),
      ),
    );
  }
}
