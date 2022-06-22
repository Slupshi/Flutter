import 'package:flutter/material.dart';
import 'package:myapplicationtest/pages/catalog.dart';
import 'package:myapplicationtest/widgets/APIMovie.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  LoadingScreenState createState() => LoadingScreenState();

}

class LoadingScreenState extends State<LoadingScreen>
{
  String loadingScreenText = "Chargement de l'application en cours ...";
  Color loadingScreenTextColor = Colors.black38;



  @override
  void initState() {
    super.initState();
    bool isSuccess = ApiMovies.tryGetCatalog();
    Future.delayed(const Duration(seconds: 3), () {
      isSuccess ? Navigator.push(context, MaterialPageRoute(builder: (context) => CatalogPage())) : setState((){ loadingScreenText = "Echec du chargement de l'application"; loadingScreenTextColor = Colors.red; });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column( mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(loadingScreenText, style: TextStyle(color: loadingScreenTextColor),),)
      ],
    );
  }

}


