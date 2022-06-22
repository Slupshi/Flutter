import 'package:flutter/material.dart';

class PageHome extends StatelessWidget{
  const PageHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    const customOrange = Color.fromRGBO(255, 165, 109, 1);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customOrange,
        title: const Text('HomePage'),
        centerTitle: true,
        leading: const Icon(Icons.home),
        actions: const [
          Icon(Icons.access_alarm),
          Icon(Icons.accessible_forward_rounded),
          Icon(Icons.directions_bike_rounded)
        ],
      ),
      //body: Text('Test n°3'),
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
    );
  }
}