import 'package:flutter/material.dart';

class AlertModal extends StatefulWidget {
  const AlertModal({Key? key}) : super(key: key);

  @override
  State<AlertModal> createState() => _AlertModalState();
}

class _AlertModalState extends State<AlertModal> {

  Future<void> alerte(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext contextDialog) {
          return AlertDialog(
            title: Text(
              "Ceci est une alerte",
              textScaleFactor: 1.3,
            ),
            content: Text("Nous avons un problème"),
            contentPadding: EdgeInsets.all(5.0),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    print('abort');
                    Navigator.pop(contextDialog);
                  },
                  child: Text(
                    'Annuler',
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    print('Continuer');
                    Navigator.pop(contextDialog); // ferme la popup
                  },
                  child: Text(
                    'Continuer',
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    const customOrange = Color.fromRGBO(255, 165, 109, 1);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                alerte(context);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(customOrange),
                  elevation: MaterialStateProperty.all<double>(10)),
              child: Text('SnackBar Alert')
          )
        ],
      ),
    );
  }
}