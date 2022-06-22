import 'package:flutter/material.dart';
import 'package:myapplicationtest/pages/calculator.dart';
import 'package:myapplicationtest/widgets/snack.dart';
import 'package:myapplicationtest/widgets/snack_alert.dart';
import 'package:myapplicationtest/pages/imagePage.dart';
import 'package:myapplicationtest/widgets/popup.dart';
import 'package:myapplicationtest/widgets/bottomNavbar.dart';

class PageState extends StatefulWidget{
  const PageState({Key? key}) : super(key: key);

  @override
  _PageStateState createState() => _PageStateState();
}

class _PageStateState extends State<PageState> {



  @override
  Widget build(BuildContext context) {
    double largeur = (MediaQuery.of(context).size.width);
    const customOrange = Color.fromRGBO(255, 165, 109, 1);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customOrange,
        title: const Text('HomePage'),
        centerTitle: true,
        //actions: const [
        //  Icon(Icons.accessible_forward_rounded),
        //],
      ),
      body: Container(
        child:
            Column( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                width: largeur/2,
                height: largeur/6,
                  child : Snack(),),
                SizedBox(
                width: largeur/2,
                height: largeur/6,
                child : AlertModal(),),
                Center(
                    child:
                        SizedBox(
                          width: largeur/2,
                          height: largeur/6,
                          child:
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const AlertDialogModal()),
                              );
                            },
                            style:  ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(customOrange),
                              elevation: MaterialStateProperty.all<double>(10),
                            ),
                            child: const Text('Images'),
                          ),
                        ),
                ),
                Center(
                  child:
                  SizedBox(
                    width: largeur/2,
                    height: largeur/6,
                    child:
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CalculatorPage()),
                        );
                      },
                      style:  ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(customOrange),
                        elevation: MaterialStateProperty.all<double>(10),
                      ),
                      child: const Text('Calculatrice'),
                    ),
                  ),
                ),
                //BottomNavBar(),
              ],
            ),
      ),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      floatingActionButton: FloatingActionButton(onPressed: () { }, backgroundColor: customOrange, child: const Icon(Icons.accessible_forward_rounded),),

    );
  }
}