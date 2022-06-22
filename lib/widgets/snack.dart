import 'package:flutter/material.dart';

class Snack extends StatefulWidget {
  const Snack({Key? key}) : super(key: key);

  @override
  State<Snack> createState() => _SnackState();
}

class _SnackState extends State<Snack> {
  void callSnack(BuildContext context) {
    SnackBar snackbar = SnackBar(
      content: Text('Je suis la snackbar'),
      duration: Duration(seconds: 10),
      backgroundColor: Colors.black38,
      action: SnackBarAction(
        label: 'Clic',
        textColor: Colors.white,
        onPressed: () {
          print('Clic snackbar');
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
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
              callSnack(context);
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(customOrange),
                elevation: MaterialStateProperty.all<double>(10)),
            child: Text('SnackBar'),
          )
        ],
      ),
    );
  }
}
