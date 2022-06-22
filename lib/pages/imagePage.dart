import "package:flutter/material.dart";


class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();

}

class _ImagePageState extends State<ImagePage>{



  @override
  Widget build(BuildContext context) {
    const customOrange = Color.fromRGBO(255, 165, 109, 1);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customOrange,
        title: const Text('Emile et Images'),
        centerTitle: true,
        //actions: const [
        //  Icon(Icons.accessible_forward_rounded),
        //],
      ),
      body: Column(children: [
        Image.network("https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg"),
      ],),
    );
  }
}


