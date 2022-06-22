import 'package:flutter/material.dart';
import 'package:myapplicationtest/pages/imagePage.dart';

class AlertDialogModal extends StatefulWidget {
  const AlertDialogModal({Key? key}) : super(key: key);

  @override
  State<AlertDialogModal> createState() => _AlertDialogState();
}

class _AlertDialogState extends State<AlertDialogModal> {

  Future<void> showModal(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext contextDialog) {
          return AlertDialog(
            title: const Text(
              "Toto",
              textScaleFactor: 1.3,
            ),
            content: const Text("Nous avons un problème"),
            contentPadding: const EdgeInsets.all(5.0),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    print('abort');
                    Navigator.pop(contextDialog);
                  },
                  child: const Text(
                    'Annuler',
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    print('Continuer');
                    Navigator.pop(contextDialog);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ImagePage()),
                    );// ferme la popup
                  },
                  child: const Text(
                    'Continuer',
                    style: const TextStyle(color: Colors.blue),
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
                showModal(context);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(customOrange),
                  elevation: MaterialStateProperty.all<double>(10)),
              child: const Text('SnackBar Alert')
          )
        ],
      ),
    );
  }
}









