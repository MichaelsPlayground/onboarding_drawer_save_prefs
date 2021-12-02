import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final String name;
  final String urlImage;

  const UserPage({
    Key? key,
    required this.name,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(name),
          centerTitle: true,
        ),
        //body: Image.network(
    body: Image.asset(
          urlImage,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.contain,
        ),
      );
}
